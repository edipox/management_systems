class Requests::Devolutions::ComponentsController < ApplicationController
  # GET /requests/devolutions/components
  # GET /requests/devolutions/components.json
  
  layout "dialog"

  def index
    @requests_devolutions_components = Requests::Devolutions::Component.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /requests/devolutions/components/1
  # GET /requests/devolutions/components/1.json
  def show
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
    respond_to do |format|
      format.html{ render 'show', :layout => "default" } # show.html.erb
    end
  end

  # GET /requests/devolutions/components/new
  # GET /requests/devolutions/components/new.json
  def new
    @requests_devolutions_component = Requests::Devolutions::Component.new
    respond_to do |format|
      format.html # new.html.erb
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
        format.html { render action: 'show', :layout => "default" , notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/devolutions/components/1
  # PUT /requests/devolutions/components/1.json
  def update
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])

    respond_to do |format|
      if @requests_devolutions_component.update_attributes(params[:requests_devolutions_component])
        format.html { render action: 'show', :layout => "default" , notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/devolutions/components/1
  # DELETE /requests/devolutions/components/1.json
  def destroy
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
    
#    if @requests_devolutions_component.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to requests_devolutions_components_path, notice: 'No se puede eliminar el registro "'+@requests_devolutions_component.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @requests_devolutions_component.destroy

    respond_to do |format|
      format.html { redirect_to  requests_devolutions_components_path }
    end
  end
end
