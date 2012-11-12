class Components::ModelsController < ApplicationController
  # GET /components/models
  # GET /components/models.json
  
  layout "dialog"

  def index
    @components_models = Components::Model.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /components/models/1
  # GET /components/models/1.json
  def show
    @components_model = Components::Model.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /components/models/new
  # GET /components/models/new.json
  def new
    @components_model = Components::Model.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /components/models/1/edit
  def edit
    @components_model = Components::Model.find(params[:id])
  end

  # POST /components/models
  # POST /components/models.json
  def create
    @components_model = Components::Model.new(params[:components_model])

    respond_to do |format|
      if @components_model.save
        format.html { redirect_to components_models_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /components/models/1
  # PUT /components/models/1.json
  def update
    @components_model = Components::Model.find(params[:id])

    respond_to do |format|
      if @components_model.update_attributes(params[:components_model])
        format.html { redirect_to components_models_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /components/models/1
  # DELETE /components/models/1.json
  def destroy
    @components_model = Components::Model.find(params[:id])
    
#    if @components_model.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to components_models_path, notice: 'No se puede eliminar el registro "'+@components_model.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @components_model.destroy

    respond_to do |format|
      format.html { redirect_to  components_models_path }
    end
  end
end
