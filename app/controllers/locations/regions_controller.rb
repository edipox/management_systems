class Locations::RegionsController < ApplicationController
  # GET /locations/regions
  # GET /locations/regions.json
  
  layout "dialog"

  def index
    @locations_regions = Locations::Region.paginate(:page => params[:page])
  end

  # GET /locations/regions/1
  # GET /locations/regions/1.json
  def show
    @locations_region = Locations::Region.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /locations/regions/new
  # GET /locations/regions/new.json
  def new
    @locations_region = Locations::Region.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /locations/regions/1/edit
  def edit
    @locations_region = Locations::Region.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /locations/regions
  # POST /locations/regions.json
  def create
    @locations_region = Locations::Region.new(params[:locations_region])
    index
    respond_to do |format|
      if @locations_region.save
        format.js { @notice = 'Registro guardado correctamente.' 
        render 'index'
        }
      else
        format.js { @notice = 'Error al guardar el registro.'
        render action: "new" }
      end
    end
  end

  # PUT /locations/regions/1
  # PUT /locations/regions/1.json
  def update
    @locations_region = Locations::Region.find(params[:id])
    index
    respond_to do |format|
      if @locations_region.update_attributes(params[:locations_region])
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

  # DELETE /locations/regions/1
  # DELETE /locations/regions/1.json
  def destroy
    @locations_region = Locations::Region.find(params[:id])
    @locations_region.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
end
