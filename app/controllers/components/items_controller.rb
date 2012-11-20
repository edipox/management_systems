class Components::ItemsController < ApplicationController
  # GET /components/items
  # GET /components/items.json
  layout "dialog"
  
  def index
    @components_items = Components::Item.paginate(:page => params[:page])
#    respond_to do |format|
#      format.html{ render 'index', :layout => "default" }
#      format.js
#      format.json { render json: @components_items }
#    end
  end

  # GET /components/items/1
  # GET /components/items/1.json
  def show
    @components_item = Components::Item.find(params[:id])
    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @components_item }
      format.js
    end
  end

  # GET /components/items/new
  # GET /components/items/new.json
  def new
    @components_item = Components::Item.new
    respond_to do |format|
      format.js
    end
  end

  # GET /components/items/1/edit
  def edit
    @components_item = Components::Item.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /components/items
  # POST /components/items.json
  def create
    process_fields
    @components_item = Components::Item.new(params[:components_item])
    index
    respond_to do |format|
      if @components_item.save
        Stocks::Component.create!({ component: @components_item, quantity: params[:initial_stock_qty] })
        format.js { @notice = 'Componente creado correctamente.'
        render 'index' }
      else
        format.js { 
        render action: "new"}
      end
    end
  end

  # PUT /components/items/1
  # PUT /components/items/1.json
  def update
    process_fields
    @components_item = Components::Item.find(params[:id])
    index
    respond_to do |format|
      if @components_item.update_attributes(params[:components_item])
        format.js {  @notice = 'Componente actualizado correctamente.' 
        render 'index'}
      else
        format.js {  @notice = 'Error al actualizar componente.'  
        render action: "edit"}
      end
    end
  end

  # DELETE /components/items/1
  # DELETE /components/items/1.json
  def destroy
    @components_item = Components::Item.find(params[:id])
    @components_item.destroy
        
    respond_to do |format|
      format.html { redirect_to components_items_url }
      format.json { head :no_content }
      format.js {     
          # Variable utilizada para re renderizar index
          @components_items = Components::Item.paginate(:page => params[:page])
          render action: "index"
      }
    end
  end

  private

  def process_fields
    process_category
    process_brand
  end

  def process_category
    return if params[:new_category] == 'false'

    params[:components_item][:category_id] = nil 

    category = Components::Category.new({
      name: params[:category_name],
      description: params[:category_description]
    })
    raise 'Error al guardar la nueva categoria' unless category.save

    params[:components_item][:category_id] = category.id
  end
  
  def process_brand
    return if params[:new_brand] == 'false'

    params[:components_item][:brand_id] = nil 

    brand = Components::Brand.new({
      name: params[:brand_name],
      description: params[:brand_description]
    })
    raise 'Error al guardar la nueva marca' unless brand.save

    params[:components_item][:brand_id] = brand.id
  end  
end
