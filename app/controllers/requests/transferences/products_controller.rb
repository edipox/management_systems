class Requests::Transferences::ProductsController < ApplicationController
  # GET /requests/transferences/products
  # GET /requests/transferences/products.json
  
  layout "dialog"

  def index
    @requests_transferences_products = Requests::Transferences::Product.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /requests/transferences/products/1
  # GET /requests/transferences/products/1.json
  def show
    @requests_transferences_product = Requests::Transferences::Product.find(params[:id])
    respond_to do |format|
      format.html{ render 'show', :layout => "default" } # show.html.erb
    end
  end

  # GET /requests/transferences/products/new
  # GET /requests/transferences/products/new.json
  def new
    @requests_transferences_product = Requests::Transferences::Product.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /requests/transferences/products/1/edit
  def edit
    @requests_transferences_product = Requests::Transferences::Product.find(params[:id])
  end

  # POST /requests/transferences/products
  # POST /requests/transferences/products.json
  def create
    @requests_transferences_product = Requests::Transferences::Product.new(params[:requests_transferences_product])

    respond_to do |format|
      if @requests_transferences_product.save
        format.html { render action: 'show', :layout => "default" , notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/transferences/products/1
  # PUT /requests/transferences/products/1.json
  def update
    @requests_transferences_product = Requests::Transferences::Product.find(params[:id])

    respond_to do |format|
      if @requests_transferences_product.update_attributes(params[:requests_transferences_product])
        format.html { render action: 'show', :layout => "default" , notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/transferences/products/1
  # DELETE /requests/transferences/products/1.json
  def destroy
    @requests_transferences_product = Requests::Transferences::Product.find(params[:id])
    
#    if @requests_transferences_product.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to requests_transferences_products_path, notice: 'No se puede eliminar el registro "'+@requests_transferences_product.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @requests_transferences_product.destroy

    respond_to do |format|
      format.html { redirect_to  requests_transferences_products_path }
    end
  end
end
