class Locations::CountriesController < ApplicationController
  # GET /locations/countries
  # GET /locations/countries.json
  
  layout "dialog"

  def index
    @locations_countries = Locations::Country.paginate(:page => params[:page])
  end

  # GET /locations/countries/1
  # GET /locations/countries/1.json
  def show
    @locations_country = Locations::Country.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /locations/countries/new
  # GET /locations/countries/new.json
  def new
    @locations_country = Locations::Country.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /locations/countries/1/edit
  def edit
    @locations_country = Locations::Country.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /locations/countries
  # POST /locations/countries.json
  def create
    @locations_country = Locations::Country.new(params[:locations_country])
    index
    respond_to do |format|
      if @locations_country.save
        format.js { @notice = 'Registro guardado correctamente.' 
        render 'index'
        }
      else
        format.js { @notice = 'Error al guardar el registro.' 
        render action: "new"}
      end
    end
  end

  # PUT /locations/countries/1
  # PUT /locations/countries/1.json
  def update
    @locations_country = Locations::Country.find(params[:id])
    index
    respond_to do |format|
      if @locations_country.update_attributes(params[:locations_country])
        format.js { @notice = 'Registro actualizado correctamente.' 
        render 'index'
        }
      else
        format.js { 
        @notice = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /locations/countries/1
  # DELETE /locations/countries/1.json
  def destroy
    @locations_country = Locations::Country.find(params[:id])
    @locations_country.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
end
