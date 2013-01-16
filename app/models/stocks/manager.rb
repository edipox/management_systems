class Stocks::Manager 
	
	def self.subtract plural, params
	    raise "Too much params: product_id & component_id" if params[:product_id] && params[:component_id]
	    prefix = params[:component_quantity] ? 'component_' : params[:product_quantity] ? 'product_' : ''
	    id_prefix = params[:component_id] ? 'component' : 'product'
	    finder_class = id_prefix == 'component' ? Components::Item : Products::Composition
	    id = params[:"#{id_prefix}_id"]
		raise "Nonexistent #{id_prefix} with params #{params.inspect}" unless id && element = finder_class.find(id)
		quantity = params[:"#{prefix}quantity"] || params[:quantity]
		price = params[:"#{prefix}price"] || params[:price]
		raise "Params not enough #{params.inspect} for #{id_prefix}" unless quantity && price
		stock = eval "element.#{plural}"
		sum = stock.reduce { |s1, s2| eval "s1.#{prefix}quantity += s2.#{prefix}quantity; s1" }
		if eval "quantity > 0 && quantity <= sum.#{prefix}quantity"
			while quantity > 0 # LIFO method
				last = stock.last
				last_quantity = eval "last.#{prefix}quantity"
				if last_quantity > quantity
					eval "last.#{prefix}quantity = last_quantity - quantity"
					last.save!
				else last.destroy end
				quantity = quantity - last_quantity
			end
			return true
		else 
			return false
		end
  	end

end