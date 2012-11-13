class Locations::CitiesController < ApplicationController
  # GET /locations/cities
  # GET /locations/cities.json
  
  layout "dialog"

  def index
    @locations_cities = Locations::City.paginate(:page => params[:page])
  end

  # GET /locations/cities/1
  # GET /locations/cities/1.json
  def show
    @locations_city = Locations::City.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /locations/cities/new
  # GET /locations/cities/new.json
  def new
    @locations_city = Locations::City.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /locations/cities/1/edit
  def edit
    @locations_city = Locations::City.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /locations/cities
  # POST /locations/cities.json
  def create
    @locations_city = Locations::City.new(params[:locations_city])
    index
    respond_to do |format|
      if @locations_city.save
        format.js { render 'index', notice: 'Registro guardado correctamente.' 
        }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /locations/cities/1
  # PUT /locations/cities/1.json
  def update
    @locations_city = Locations::City.find(params[:id])
    index
    respond_to do |format|
      if @locations_city.update_attributes(params[:locations_city])
        format.js { render 'index', notice: 'Registro actualizado correctamente.' 
        }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /locations/cities/1
  # DELETE /locations/cities/1.json
  def destroy
    @locations_city = Locations::City.find(params[:id])
    @locations_city.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
end
