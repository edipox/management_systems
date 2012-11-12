class Locations::CitiesController < ApplicationController
  # GET /locations/cities
  # GET /locations/cities.json
  
  layout "dialog"

  def index
    @locations_cities = Locations::City.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /locations/cities/1
  # GET /locations/cities/1.json
  def show
    @locations_city = Locations::City.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /locations/cities/new
  # GET /locations/cities/new.json
  def new
    @locations_city = Locations::City.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /locations/cities/1/edit
  def edit
    @locations_city = Locations::City.find(params[:id])
  end

  # POST /locations/cities
  # POST /locations/cities.json
  def create
    @locations_city = Locations::City.new(params[:locations_city])

    respond_to do |format|
      if @locations_city.save
        format.html { redirect_to locations_cities_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /locations/cities/1
  # PUT /locations/cities/1.json
  def update
    @locations_city = Locations::City.find(params[:id])

    respond_to do |format|
      if @locations_city.update_attributes(params[:locations_city])
        format.html { redirect_to locations_cities_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /locations/cities/1
  # DELETE /locations/cities/1.json
  def destroy
    @locations_city = Locations::City.find(params[:id])
    
#    if @locations_city.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to locations_cities_path, notice: 'No se puede eliminar el registro "'+@locations_city.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @locations_city.destroy

    respond_to do |format|
      format.html { redirect_to  locations_cities_path }
    end
  end
end
