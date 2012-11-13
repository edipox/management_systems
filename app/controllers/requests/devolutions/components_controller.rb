class Requests::Devolutions::ComponentsController < ApplicationController
  # GET /requests/devolutions/components
  # GET /requests/devolutions/components.json
  
  layout "dialog"

  def list
    @requests_devolutions_components = Requests::Devolutions::Component.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/devolutions/components/1
  # GET /requests/devolutions/components/1.json
  def show
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/devolutions/components/new
  # GET /requests/devolutions/components/new.json
  def new
    @requests_devolutions_component = Requests::Devolutions::Component.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /requests/devolutions/components/1/edit
  def edit
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
  end

  # POST /requests/devolutions/components
  # POST /requests/devolutions/components.json
  def create
    @requests_devolutions_component = Requests::Devolutions::Component.new(params[:requests_devolutions_component])
    respond_to do |format|
      if @requests_devolutions_component.save
        format.js { render action: 'show', notice: 'Registro actualizado correctamente.' }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/devolutions/components/1
  # PUT /requests/devolutions/components/1.json
  def update
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])

    respond_to do |format|
      if @requests_devolutions_component.update_attributes(params[:requests_devolutions_component])
        format.js { render action: 'show', notice: 'Registro guardado correctamente.' }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/devolutions/components/1
  # DELETE /requests/devolutions/components/1.json
  def destroy
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
    @requests_devolutions_component.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
