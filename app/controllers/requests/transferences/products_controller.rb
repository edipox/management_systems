class Requests::Transferences::ProductsController < ApplicationController
  # GET /requests/transferences/products
  # GET /requests/transferences/products.json
  
  layout "dialog"

  def list
    @requests_transferences_products = Requests::Transferences::Product.paginate(:page => params[:page])
    delete_if_void @requests_transferences_products
    @requests_transferences_products = Requests::Transferences::Product.all.reverse.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def index
    list  
    @title = "Pedidos de transferencia de productos"
    respond_to do |format|
      format.js
      format.pdf {
        @requests_transferences_products = Requests::Transferences::Product.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/requests/transferences/products/index.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'pdf.html.erb' 
      }     
    end
  end

  # GET /requests/transferences/products/1
  # GET /requests/transferences/products/1.json
  def show
    @requests_transferences_product = Requests::Transferences::Product.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/transferences/products/new
  # GET /requests/transferences/products/new.json
  def new
    @requests_transferences_product = Requests::Transferences::Product.new
    respond_to do |format|
      format.js # new.html.erb
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
    @requests_devolutions_component.user = current_user
    @requests_devolutions_component.save
    respond_to do |format|
      if @requests_transferences_product.save
        format.js { render action: 'show' }
      else
        format.js { @notice = 'Error al guardar el registro.' 
        render action: "new"}
      end
    end
  end

  # PUT /requests/transferences/products/1
  # PUT /requests/transferences/products/1.json
  def update
    @requests_transferences_product = Requests::Transferences::Product.find(params[:id])

    respond_to do |format|
      if @requests_transferences_product.update_attributes(params[:requests_transferences_product])
        format.js { @notice = 'Registro guardado correctamente.' 
        render action: 'show'}
      else
        format.js { 
        @notice = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/transferences/products/1
  # DELETE /requests/transferences/products/1.json
  def destroy
    @requests_transferences_product = Requests::Transferences::Product.find(params[:id])
    @requests_transferences_product.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
