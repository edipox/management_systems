class Requests::Devolutions::ProductsController < ApplicationController
  # GET /requests/devolutions/products
  # GET /requests/devolutions/products.json
  
  layout "dialog"

  def list
    @requests_devolutions_products = Requests::Devolutions::Product.paginate(:page => params[:page])
    delete_if_void @requests_devolutions_products
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
    @hide_status_select = true
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
    @requests_devolutions_product.status = @default_status
    transaction = Stocks::Transactions::Product.new
    transaction.kind = "Requests::Devolutions::Product"
    @requests_devolutions_product.user = current_user
    @requests_devolutions_product.transaction_id = "nil"
    @requests_devolutions_product.save
    transaction.kind_id = @requests_devolutions_product.id
    transaction.save
    @requests_devolutions_product.transaction = transaction

    respond_to do |format|
      if @requests_devolutions_product.save
        format.js { render action: 'show' }
      else
        format.js {
        render action: "new"}
      end
    end
  end

  # PUT /requests/devolutions/products/1
  # PUT /requests/devolutions/products/1.json
  def update
    @requests_devolutions_product = Requests::Devolutions::Product.find(params[:id])

    respond_to do |format|
      if @requests_devolutions_product.update_attributes(params[:requests_devolutions_product])
        format.js {  @notice = 'Registro guardado correctamente.' 
        render action: 'show'}
      else
        format.js { 
        @notice = "Error al actualizar el registro"
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
