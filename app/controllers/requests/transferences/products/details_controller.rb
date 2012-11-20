class Requests::Transferences::Products::DetailsController < ApplicationController
  # GET /requests/transferences/products/details
  # GET /requests/transferences/products/details.json
  
  layout "default"

  def index
    @requests_transferences_products_details = Requests::Transferences::Products::Detail.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/transferences/products/details/1
  # GET /requests/transferences/products/details/1.json
  def show
    @requests_transferences_products_detail = Requests::Transferences::Products::Detail.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/transferences/products/details/new
  # GET /requests/transferences/products/details/new.json
  def new
    @requests_transferences_product = Requests::Transferences::Product.find(params["header_id"])
    @requests_transferences_products_detail = Requests::Transferences::Products::Detail.new
    @requests_transferences_products_details = @requests_transferences_product.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js{ render 'update_list_form' }
    end
  end

  # GET /requests/transferences/products/details/1/edit
  def edit
    @requests_transferences_products_detail = Requests::Transferences::Products::Detail.find(params[:id])
    @requests_transferences_product = @requests_transferences_products_detail.requests_transferences_product;
    @requests_transferences_products_details = @requests_transferences_product.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  # POST /requests/transferences/products/details
  # POST /requests/transferences/products/details.json
  def create
    @requests_transferences_products_detail = Requests::Transferences::Products::Detail.new(params[:requests_transferences_products_detail])
    @requests_transferences_products_detail.requests_transferences_product = Requests::Transferences::Product.find(params["header_id"])
    @requests_transferences_products_details = @requests_transferences_products_detail.requests_transferences_product.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_transferences_products_detail.save
        format.js{ 
          @requests_transferences_product = @requests_transferences_products_detail.requests_transferences_product
          #@orders_productions_details = @production.details
          @requests_transferences_products_detail = Requests::Transferences::Products::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { @notice = 'Error al guardar el registro.'; redirect_to :back }
      end
    end
  end

  # PUT /requests/transferences/products/details/1
  # PUT /requests/transferences/products/details/1.json
  def update
    @requests_transferences_products_detail = Requests::Transferences::Products::Detail.find(params[:id])
    @requests_transferences_product = @requests_transferences_products_detail.requests_transferences_product;
    @requests_transferences_products_details = @requests_transferences_product.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_transferences_products_detail.update_attributes(params[:requests_transferences_products_detail])
        format.js{ 
          @requests_transferences_products_detail = Requests::Transferences::Products::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { 
        @notice = "Error al actualizar el registro"
        redirect_to :back }
      end
    end
  end

  def destroy
    @requests_transferences_products_detail = Requests::Transferences::Products::Detail.find(params[:id])
    @requests_transferences_product = @requests_transferences_products_detail.requests_transferences_product
    @requests_transferences_products_details = @requests_transferences_product.details.paginate(:page => params[:page])
    @requests_transferences_products_detail.destroy
    respond_to do |format|
        format.js{ 
          @requests_transferences_products_detail =  Requests::Transferences::Products::Detail.new
          render 'update_list' 
         }
    end
  end
end

