class Locations::ContinentsController < ApplicationController
  # GET /locations/continents
  # GET /locations/continents.json
  
  layout "dialog"

  def index
    @locations_continents = Locations::Continent.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /locations/continents/1
  # GET /locations/continents/1.json
  def show
    @locations_continent = Locations::Continent.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /locations/continents/new
  # GET /locations/continents/new.json
  def new
    @locations_continent = Locations::Continent.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /locations/continents/1/edit
  def edit
    @locations_continent = Locations::Continent.find(params[:id])
  end

  # POST /locations/continents
  # POST /locations/continents.json
  def create
    @locations_continent = Locations::Continent.new(params[:locations_continent])

    respond_to do |format|
      if @locations_continent.save
        format.html { redirect_to locations_continents_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /locations/continents/1
  # PUT /locations/continents/1.json
  def update
    @locations_continent = Locations::Continent.find(params[:id])

    respond_to do |format|
      if @locations_continent.update_attributes(params[:locations_continent])
        format.html { redirect_to locations_continents_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /locations/continents/1
  # DELETE /locations/continents/1.json
  def destroy
    @locations_continent = Locations::Continent.find(params[:id])
    
#    if @locations_continent.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to locations_continents_path, notice: 'No se puede eliminar el registro "'+@locations_continent.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @locations_continent.destroy

    respond_to do |format|
      format.html { redirect_to  locations_continents_path }
    end
  end
end
