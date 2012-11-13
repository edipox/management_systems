class Requests::Devolutions::Products::DetailsController < ApplicationController
  # GET /requests/devolutions/products/details
  # GET /requests/devolutions/products/details.json
  
  layout "default"

  def index
    @requests_devolutions_products_details = Requests::Devolutions::Products::Detail.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/devolutions/products/details/1
  # GET /requests/devolutions/products/details/1.json
  def show
    @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/devolutions/products/details/new
  # GET /requests/devolutions/products/details/new.json
  def new
    @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.new
    respond_to do |format|
    end
  end

  # GET /requests/devolutions/products/details/1/edit
  def edit
    @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.find(params[:id])
    @requests_devolutions_product = @requests_devolutions_products_detail.requests_devolutions_product;
    @requests_devolutions_products_details = @requests_devolutions_product.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  # POST /requests/devolutions/products/details
  # POST /requests/devolutions/products/details.json
  def create
    @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.new(params[:requests_devolutions_products_detail])
    @requests_devolutions_products_detail.requests_devolutions_product = Requests::Devolutions::Product.find(params["header_id"])
    @requests_devolutions_products_details = @requests_devolutions_products_detail.requests_devolutions_product.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_devolutions_products_detail.save
        format.js{ 
          @requests_devolutions_product = @requests_devolutions_products_detail.requests_devolutions_product
          #@orders_productions_details = @production.details
          @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { redirect_to :back, notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/devolutions/products/details/1
  # PUT /requests/devolutions/products/details/1.json
  def update
    @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.find(params[:id])
    @requests_devolutions_product = @requests_devolutions_products_detail.requests_devolutions_product;
    @requests_devolutions_products_details = @requests_devolutions_product.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_devolutions_products_detail.update_attributes(params[:requests_devolutions_products_detail])
        format.js{ 
          @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        redirect_to :back }
      end
    end
  end

  def destroy
    @requests_devolutions_products_detail = Requests::Devolutions::Products::Detail.find(params[:id])
    @requests_devolutions_product = @requests_devolutions_products_detail.requests_devolutions_product
    @requests_devolutions_products_details = @requests_devolutions_product.details.paginate(:page => params[:page])
    @requests_devolutions_products_detail.destroy
    respond_to do |format|
        format.js{ 
          @requests_devolutions_products_detail =  Requests::Devolutions::Products::Detail.new
          render 'update_list' 
         }
    end
  end
end

