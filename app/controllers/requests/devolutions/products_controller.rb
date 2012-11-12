class Requests::Devolutions::ProductsController < ApplicationController
  # GET /requests/devolutions/products
  # GET /requests/devolutions/products.json
  
  layout "dialog"

  def index
    @requests_devolutions_products = Requests::Devolutions::Product.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /requests/devolutions/products/1
  # GET /requests/devolutions/products/1.json
  def show
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])
    respond_to do |format|
      format.html{ render 'show', :layout => "default" } # show.html.erb
    end
  end

  # GET /requests/devolutions/products/new
  # GET /requests/devolutions/products/new.json
  def new
    @requests_devolutions_product = Requests::Devolutions::Product.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /requests/devolutions/products/1/edit
  def edit
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])
  end

  # POST /requests/devolutions/products
  # POST /requests/devolutions/products.json
  def create
    @requests_devolutions_product = Requests::Devolutions::Product.new(params[:requests_devolutions_product])

    respond_to do |format|
      if @requests_devolutions_product.save
        format.html { render action: 'show', :layout => "default" , notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/devolutions/products/1
  # PUT /requests/devolutions/products/1.json
  def update
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])

    respond_to do |format|
      if @requests_devolutions_product.update_attributes(params[:requests_devolutions_product])
        format.html { render action: 'show', :layout => "default" , notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/devolutions/products/1
  # DELETE /requests/devolutions/products/1.json
  def destroy
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])
    
#    if @requests_devolutions_product.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to requests_devolutions_products_path, notice: 'No se puede eliminar el registro "'+@requests_devolutions_product.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @requests_devolutions_product.destroy

    respond_to do |format|
      format.html { redirect_to  requests_devolutions_products_path }
    end
  end
end
