class Requests::Purchases::Components::DetailsController < ApplicationController
  # GET /requests/purchases/components/details
  # GET /requests/purchases/components/details.json
  
  layout "default"

  def index
    @requests_purchases_components_details = Requests::Purchases::Components::Detail.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/purchases/components/details/1
  # GET /requests/purchases/components/details/1.json
  def show
    @requests_purchases_components_detail = Requests::Purchases::Components::Detail.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/purchases/components/details/new
  # GET /requests/purchases/components/details/new.json
  def new
    @requests_purchases_components_detail = Requests::Purchases::Components::Detail.new
    @requests_purchases_component = Requests::Purchases::Component.find(params["header_id"])
    @requests_purchases_components_details = @requests_purchases_component.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js{ render 'update_list_form' }
    end
  end

  # GET /requests/purchases/components/details/1/edit
  def edit
    @requests_purchases_components_detail = Requests::Purchases::Components::Detail.find(params[:id])
    @requests_purchases_component = @requests_purchases_components_detail.requests_purchases_component;
    @requests_purchases_components_details = @requests_purchases_component.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  # POST /requests/purchases/components/details
  # POST /requests/purchases/components/details.json
  def create
    @requests_purchases_components_detail = Requests::Purchases::Components::Detail.new(params[:requests_purchases_components_detail])
    @requests_purchases_components_detail.requests_purchases_component = Requests::Purchases::Component.find(params["header_id"])
    @requests_purchases_components_details = @requests_purchases_components_detail.requests_purchases_component.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_purchases_components_detail.save
        format.js{ 
          @requests_purchases_component = @requests_purchases_components_detail.requests_purchases_component
          #@orders_productions_details = @production.details
          @requests_purchases_components_detail = Requests::Purchases::Components::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { @notice = 'Error al guardar el registro.'; redirect_to :back }
      end
    end
  end

  # PUT /requests/purchases/components/details/1
  # PUT /requests/purchases/components/details/1.json
  def update
    @requests_purchases_components_detail = Requests::Purchases::Components::Detail.find(params[:id])
    @requests_purchases_component = @requests_purchases_components_detail.requests_purchases_component;
    @requests_purchases_components_details = @requests_purchases_component.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_purchases_components_detail.update_attributes(params[:requests_purchases_components_detail])
        format.js{ 
          @requests_purchases_components_detail = Requests::Purchases::Components::Detail.new
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
    @requests_purchases_components_detail = Requests::Purchases::Components::Detail.find(params[:id])
    @requests_purchases_component = @requests_purchases_components_detail.requests_purchases_component
    @requests_purchases_components_details = @requests_purchases_component.details.paginate(:page => params[:page])
    @requests_purchases_components_detail.destroy
    respond_to do |format|
        format.js{ 
          @requests_purchases_components_detail =  Requests::Purchases::Components::Detail.new
          render 'update_list' 
         }
    end
  end
end

