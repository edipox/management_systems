class Locations::ContinentsController < ApplicationController
  # GET /locations/continents
  # GET /locations/continents.json
  
  layout "dialog"

  def index
    @locations_continents = Locations::Continent.paginate(:page => params[:page])
  end

  # GET /locations/continents/1
  # GET /locations/continents/1.json
  def show
    @locations_continent = Locations::Continent.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /locations/continents/new
  # GET /locations/continents/new.json
  def new
    @locations_continent = Locations::Continent.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /locations/continents/1/edit
  def edit
    @locations_continent = Locations::Continent.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /locations/continents
  # POST /locations/continents.json
  def create
    @locations_continent = Locations::Continent.new(params[:locations_continent])
    index
    respond_to do |format|
      if @locations_continent.save
        format.js { 
        @notice = 'Registro guardado correctamente.' 
        render 'index'
        }
      else
        format.js { 
        @notice = 'Error al guardar el registro.' 
        render action: "new"}
      end
    end
  end

  # PUT /locations/continents/1
  # PUT /locations/continents/1.json
  def update
    @locations_continent = Locations::Continent.find(params[:id])
    index
    respond_to do |format|
      if @locations_continent.update_attributes(params[:locations_continent])
        format.js { 
          @notice = 'Registro actualizado correctamente.' 
          render 'index'
        }
      else
        format.js { 
        @notice = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /locations/continents/1
  # DELETE /locations/continents/1.json
  def destroy
    @locations_continent = Locations::Continent.find(params[:id])
    @locations_continent.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
end
