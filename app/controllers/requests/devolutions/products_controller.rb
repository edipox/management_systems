class Requests::Devolutions::ProductsController < ApplicationController
  # GET /requests/devolutions/products
  # GET /requests/devolutions/products.json
  
  layout "dialog"

  def list
    @requests_devolutions_products = Requests::Devolutions::Product.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/devolutions/products/1
  # GET /requests/devolutions/products/1.json
  def show
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/devolutions/products/new
  # GET /requests/devolutions/products/new.json
  def new
    @requests_devolutions_product = Requests::Devolutions::Product.new
    respond_to do |format|
      format.js # new.html.erb
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
        format.js { render action: 'show', notice: 'Registro actualizado correctamente.' }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/devolutions/products/1
  # PUT /requests/devolutions/products/1.json
  def update
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])

    respond_to do |format|
      if @requests_devolutions_product.update_attributes(params[:requests_devolutions_product])
        format.js { render action: 'show', notice: 'Registro guardado correctamente.' }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/devolutions/products/1
  # DELETE /requests/devolutions/products/1.json
  def destroy
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])
    @requests_devolutions_product.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
