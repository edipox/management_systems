class Components::BrandsController < ApplicationController
  # GET /components/brands
  # GET /components/brands.json
  
  layout "dialog"

  def index
    @components_brands = Components::Brand.paginate(:page => params[:page])
  end

  # GET /components/brands/1
  # GET /components/brands/1.json
  def show
    @components_brand = Components::Brand.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /components/brands/new
  # GET /components/brands/new.json
  def new
    @components_brand = Components::Brand.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /components/brands/1/edit
  def edit
    @components_brand = Components::Brand.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /components/brands
  # POST /components/brands.json
  def create
    @components_brand = Components::Brand.new(params[:components_brand])
    index
    respond_to do |format|
      if @components_brand.save
        format.js { render action: 'index', notice: 'Registro guardado correctamente.' }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /components/brands/1
  # PUT /components/brands/1.json
  def update
    @components_brand = Components::Brand.find(params[:id])
    index
    respond_to do |format|
      if @components_brand.update_attributes(params[:components_brand])
        format.js { render 'index', notice: 'Registro actualizado correctamente.' 
        }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /components/brands/1
  # DELETE /components/brands/1.json
  def destroy
    @components_brand = Components::Brand.find(params[:id])
    if @components_brand.components_items != []
      respond_to do |format|
        format.js {     
            @components_categories = Components::Brand.paginate(:page => params[:page]);
            render action: "index", notice: 'No puedes eliminar la marca "'+@components_brand.name+'", porque existen registros relacionados.' 
        }
      end 
    else
      @components_brand.destroy
      respond_to do |format|
        format.js { 
          index
          render  'index'
        }
      end
    end
  end
end
