class Locations::CountriesController < ApplicationController
  # GET /locations/countries
  # GET /locations/countries.json
  
  layout "dialog"

  def index
    @locations_countries = Locations::Country.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /locations/countries/1
  # GET /locations/countries/1.json
  def show
    @locations_country = Locations::Country.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /locations/countries/new
  # GET /locations/countries/new.json
  def new
    @locations_country = Locations::Country.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /locations/countries/1/edit
  def edit
    @locations_country = Locations::Country.find(params[:id])
  end

  # POST /locations/countries
  # POST /locations/countries.json
  def create
    @locations_country = Locations::Country.new(params[:locations_country])

    respond_to do |format|
      if @locations_country.save
        format.html { redirect_to locations_countries_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /locations/countries/1
  # PUT /locations/countries/1.json
  def update
    @locations_country = Locations::Country.find(params[:id])

    respond_to do |format|
      if @locations_country.update_attributes(params[:locations_country])
        format.html { redirect_to locations_countries_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /locations/countries/1
  # DELETE /locations/countries/1.json
  def destroy
    @locations_country = Locations::Country.find(params[:id])
    
#    if @locations_country.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to locations_countries_path, notice: 'No se puede eliminar el registro "'+@locations_country.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @locations_country.destroy

    respond_to do |format|
      format.html { redirect_to  locations_countries_path }
    end
  end
end
