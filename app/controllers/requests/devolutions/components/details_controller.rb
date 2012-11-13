class Requests::Devolutions::Components::DetailsController < ApplicationController
  # GET /requests/devolutions/components/details
  # GET /requests/devolutions/components/details.json
  
  layout "default"

  def index
    @requests_devolutions_components_details = Requests::Devolutions::Components::Detail.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/devolutions/components/details/1
  # GET /requests/devolutions/components/details/1.json
  def show
    @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /requests/devolutions/components/details/new
  # GET /requests/devolutions/components/details/new.json
  def new
    @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.new
    respond_to do |format|
    end
  end

  # GET /requests/devolutions/components/details/1/edit
  def edit
    @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.find(params[:id])
    @requests_devolutions_component = @requests_devolutions_components_detail.requests_devolutions_component;
    @requests_devolutions_components_details = @requests_devolutions_component.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  # POST /requests/devolutions/components/details
  # POST /requests/devolutions/components/details.json
  def create
    @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.new(params[:requests_devolutions_components_detail])
    @requests_devolutions_components_detail.requests_devolutions_component = Requests::Devolutions::Component.find(params["header_id"])
    @requests_devolutions_components_details = @requests_devolutions_components_detail.requests_devolutions_component.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_devolutions_components_detail.save
        format.js{ 
          @requests_devolutions_component = @requests_devolutions_components_detail.requests_devolutions_component
          #@orders_productions_details = @production.details
          @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { redirect_to :back, notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/devolutions/components/details/1
  # PUT /requests/devolutions/components/details/1.json
  def update
    @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.find(params[:id])
    @requests_devolutions_component = @requests_devolutions_components_detail.requests_devolutions_component;
    @requests_devolutions_components_details = @requests_devolutions_component.details.paginate(:page => params[:page])
    respond_to do |format|
      if @requests_devolutions_components_detail.update_attributes(params[:requests_devolutions_components_detail])
        format.js{ 
          @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.new
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
    @requests_devolutions_components_detail = Requests::Devolutions::Components::Detail.find(params[:id])
    @requests_devolutions_component = @requests_devolutions_components_detail.requests_devolutions_component
    @requests_devolutions_components_details = @requests_devolutions_component.details.paginate(:page => params[:page])
    @requests_devolutions_components_detail.destroy
    respond_to do |format|
        format.js{ 
          @requests_devolutions_components_detail =  Requests::Devolutions::Components::Detail.new
          render 'update_list' 
         }
    end
  end
end

