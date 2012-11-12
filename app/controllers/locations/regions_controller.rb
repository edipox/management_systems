class Locations::RegionsController < ApplicationController
  # GET /locations/regions
  # GET /locations/regions.json
  
  layout "dialog"

  def index
    @locations_regions = Locations::Region.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /locations/regions/1
  # GET /locations/regions/1.json
  def show
    @locations_region = Locations::Region.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /locations/regions/new
  # GET /locations/regions/new.json
  def new
    @locations_region = Locations::Region.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /locations/regions/1/edit
  def edit
    @locations_region = Locations::Region.find(params[:id])
  end

  # POST /locations/regions
  # POST /locations/regions.json
  def create
    @locations_region = Locations::Region.new(params[:locations_region])

    respond_to do |format|
      if @locations_region.save
        format.html { redirect_to locations_regions_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /locations/regions/1
  # PUT /locations/regions/1.json
  def update
    @locations_region = Locations::Region.find(params[:id])

    respond_to do |format|
      if @locations_region.update_attributes(params[:locations_region])
        format.html { redirect_to locations_regions_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /locations/regions/1
  # DELETE /locations/regions/1.json
  def destroy
    @locations_region = Locations::Region.find(params[:id])
    
#    if @locations_region.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to locations_regions_path, notice: 'No se puede eliminar el registro "'+@locations_region.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @locations_region.destroy

    respond_to do |format|
      format.html { redirect_to  locations_regions_path }
    end
  end
end
