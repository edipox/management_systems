class Stocks::Component < ActiveRecord::Base
  has_paper_trail
  attr_accessible :component_id, :quantity, :price
  attr_accessible :component
  validates :component_id, :presence => true #, :length => { :minimum => 2 }  
  validates :quantity, :presence => true #, :length => { :minimum => 2 }  
  validates :price, :presence => true

  belongs_to :component, :foreign_key => :component_id, :class_name => Components::Item.to_s

  after_save :check_qty

  def check_qty
    sum = component.raw_material_stocks.reduce { |s1, s2| s1.quantity += s2.quantity; s1 }
    if component.minimum_quantity > sum.quantity
      missing_component_qty = component.minimum_quantity - sum.quantity
      
      puts "Missing component quantity "
      puts missing_component_qty
      ### Generate PurchaseOrder's
    end
  end
end
