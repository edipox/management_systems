class Components::BrandsController < ApplicationController
  # GET /components/brands
  # GET /components/brands.json
  
  layout "dialog"

  def index
    @components_brands = Components::Brand.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /components/brands/1
  # GET /components/brands/1.json
  def show
    @components_brand = Components::Brand.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /components/brands/new
  # GET /components/brands/new.json
  def new
    @components_brand = Components::Brand.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /components/brands/1/edit
  def edit
    @components_brand = Components::Brand.find(params[:id])
  end

  # POST /components/brands
  # POST /components/brands.json
  def create
    @components_brand = Components::Brand.new(params[:components_brand])

    respond_to do |format|
      if @components_brand.save
        format.html { redirect_to components_brands_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /components/brands/1
  # PUT /components/brands/1.json
  def update
    @components_brand = Components::Brand.find(params[:id])

    respond_to do |format|
      if @components_brand.update_attributes(params[:components_brand])
        format.html { redirect_to components_brands_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /components/brands/1
  # DELETE /components/brands/1.json
  def destroy
    @components_brand = Components::Brand.find(params[:id])
    
#    if @components_brand.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to components_brands_path, notice: 'No se puede eliminar el registro "'+@components_brand.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @components_brand.destroy

    respond_to do |format|
      format.html { redirect_to  components_brands_path }
    end
  end
end
