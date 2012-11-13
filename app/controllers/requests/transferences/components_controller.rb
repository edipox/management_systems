class Requests::Transferences::ComponentsController < ApplicationController
  # GET /requests/transferences/components
  # GET /requests/transferences/components.json
  
  layout "dialog"

  def list
    @requests_transferences_components = Requests::Transferences::Component.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/transferences/components/1
  # GET /requests/transferences/components/1.json
  def show
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/transferences/components/new
  # GET /requests/transferences/components/new.json
  def new
    @requests_transferences_component = Requests::Transferences::Component.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /requests/transferences/components/1/edit
  def edit
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])
  end

  # POST /requests/transferences/components
  # POST /requests/transferences/components.json
  def create
    @requests_transferences_component = Requests::Transferences::Component.new(params[:requests_transferences_component])
    respond_to do |format|
      if @requests_transferences_component.save
        format.js { render action: 'show', notice: 'Registro actualizado correctamente.' }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/transferences/components/1
  # PUT /requests/transferences/components/1.json
  def update
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])

    respond_to do |format|
      if @requests_transferences_component.update_attributes(params[:requests_transferences_component])
        format.js { render action: 'show', notice: 'Registro guardado correctamente.' }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/transferences/components/1
  # DELETE /requests/transferences/components/1.json
  def destroy
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])
    @requests_transferences_component.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
