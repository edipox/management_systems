class Components::ModelsController < ApplicationController
  # GET /components/models
  # GET /components/models.json
  
  layout "dialog"

  def index
    @components_models = Components::Model.paginate(:page => params[:page])
  end

  # GET /components/models/1
  # GET /components/models/1.json
  def show
    @components_model = Components::Model.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /components/models/new
  # GET /components/models/new.json
  def new
    @components_model = Components::Model.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /components/models/1/edit
  def edit
    @components_model = Components::Model.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /components/models
  # POST /components/models.json
  def create
    process_brand
    @components_model = Components::Model.new(params[:components_model])
    index
    respond_to do |format|
      if @components_model.save
        format.js { render 'index', notice: 'Registro guardado correctamente.' 
        }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /components/models/1
  # PUT /components/models/1.json
  def update
    process_brand
    @components_model = Components::Model.find(params[:id])
    index
    respond_to do |format|
      if @components_model.update_attributes(params[:components_model])
        format.js { render 'index', notice: 'Registro actualizado correctamente.' 
        }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /components/models/1
  # DELETE /components/models/1.json
  def destroy
    @components_model = Components::Model.find(params[:id])
    @components_model.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
  

end
