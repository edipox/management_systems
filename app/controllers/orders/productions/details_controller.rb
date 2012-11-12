class Orders::Productions::DetailsController < ApplicationController
  # GET /orders/productions/details
  # GET /orders/productions/details.json
  
  layout "default"

  def index
    @orders_productions_details = Orders::Productions::Detail.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /orders/productions/details/1
  # GET /orders/productions/details/1.json
  def show
    @orders_productions_detail = Orders::Productions::Detail.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /orders/productions/details/new
  # GET /orders/productions/details/new.json
  def new
    @orders_productions_detail = Orders::Productions::Detail.new
    respond_to do |format|
    end
  end

  # GET /orders/productions/details/1/edit
  def edit
    @orders_productions_detail = Orders::Productions::Detail.find(params[:id])
    @orders_production = @orders_productions_detail.orders_production;
    @orders_productions_details = @orders_production.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  # POST /orders/productions/details
  # POST /orders/productions/details.json
  def create
    @orders_productions_detail = Orders::Productions::Detail.new(params[:orders_productions_detail])
    @orders_productions_detail.orders_production = Orders::Production.find(params["header_id"])
    @orders_productions_details = @orders_productions_detail.orders_production.details.paginate(:page => params[:page])
    respond_to do |format|
      if @orders_productions_detail.save
        format.js{ 
          @orders_production = @orders_productions_detail.orders_production
          #@orders_productions_details = @production.details
          @orders_productions_detail = Orders::Productions::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { redirect_to :back, notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /orders/productions/details/1
  # PUT /orders/productions/details/1.json
  def update
    @orders_productions_detail = Orders::Productions::Detail.find(params[:id])
    @orders_production = @orders_productions_detail.orders_production;
    @orders_productions_details = @orders_production.details.paginate(:page => params[:page])
    respond_to do |format|
      if @orders_productions_detail.update_attributes(params[:orders_productions_detail])
        format.js{ 
          @orders_productions_detail = Orders::Productions::Detail.new
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
    @orders_productions_detail = Orders::Productions::Detail.find(params[:id])
    @orders_production = @orders_productions_detail.orders_production
    @orders_productions_details = @orders_production.details.paginate(:page => params[:page])
    @orders_productions_detail.destroy
    respond_to do |format|
        format.js{ 
          @orders_productions_detail =  Orders::Productions::Detail.new
          render 'update_list' 
         }
    end
  end
end

