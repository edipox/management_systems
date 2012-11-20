class Requests::Transferences::Components::DetailsController < ApplicationController
  # GET /requests/transferences/components/details
  # GET /requests/transferences/components/details.json
  
  layout "default"

  def index
    @requests_transferences_components_details = Requests::Transferences::Components::Detail.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/transferences/components/details/1
  # GET /requests/transferences/components/details/1.json
  def show
    @requests_transferences_components_detail = Requests::Transferences::Components::Detail.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/transferences/components/details/new
  # GET /requests/transferences/components/details/new.json
  def new
    @requests_transferences_component = Requests::Transferences::Component.find(params["header_id"])
    @requests_transferences_components_detail = Requests::Transferences::Components::Detail.new
    @requests_transferences_components_details = @requests_transferences_component.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js{ render 'update_list_form' }
    end
  end

  # GET /requests/transferences/components/details/1/edit
  def edit
    @requests_transferences_components_detail = Requests::Transferences::Components::Detail.find(params[:id])
    @requests_transferences_component = @requests_transferences_components_detail.requests_transferences_component;
    @requests_transferences_components_details = @requests_transferences_component.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  # POST /requests/transferences/components/details
  # POST /requests/transferences/components/details.json
  def create
    @requests_transferences_components_detail = Requests::Transferences::Components::Detail.new(params[:requests_transferences_components_detail])
    @requests_transferences_components_detail.requests_transferences_component = Requests::Transferences::Component.find(params["header_id"])
    @requests_transferences_components_details = @requests_transferences_components_detail.requests_transferences_component.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_transferences_components_detail.save
        format.js{ 
          @requests_transferences_component = @requests_transferences_components_detail.requests_transferences_component
          #@orders_productions_details = @production.details
          @requests_transferences_components_detail = Requests::Transferences::Components::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { @notice = 'Error al guardar el registro.'; redirect_to :back }
      end
    end
  end

  # PUT /requests/transferences/components/details/1
  # PUT /requests/transferences/components/details/1.json
  def update
    @requests_transferences_components_detail = Requests::Transferences::Components::Detail.find(params[:id])
    @requests_transferences_component = @requests_transferences_components_detail.requests_transferences_component;
    @requests_transferences_components_details = @requests_transferences_component.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_transferences_components_detail.update_attributes(params[:requests_transferences_components_detail])
        format.js{ 
          @requests_transferences_components_detail = Requests::Transferences::Components::Detail.new
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
    @requests_transferences_components_detail = Requests::Transferences::Components::Detail.find(params[:id])
    @requests_transferences_component = @requests_transferences_components_detail.requests_transferences_component
    @requests_transferences_components_details = @requests_transferences_component.details.paginate(:page => params[:page])
    @requests_transferences_components_detail.destroy
    respond_to do |format|
        format.js{ 
          @requests_transferences_components_detail =  Requests::Transferences::Components::Detail.new
          render 'update_list' 
         }
    end
  end
end

