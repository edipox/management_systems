class Products::CompositionsController < ApplicationController
  # GET /products/compositions
  # GET /products/compositions.json
  
  layout "dialog"

  def index
    @products_compositions = Products::Composition.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /products/compositions/1
  # GET /products/compositions/1.json
  def show
    @products_composition = Products::Composition.find(params[:id])
    respond_to do |format|
      format.html{ render 'show', :layout => "default" } # show.html.erb
    end
  end

  # GET /products/compositions/new
  # GET /products/compositions/new.json
  def new
    @products_composition = Products::Composition.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /products/compositions/1/edit
  def edit
    @products_composition = Products::Composition.find(params[:id])
  end

  # POST /products/compositions
  # POST /products/compositions.json
  def create
    @products_composition = Products::Composition.new(params[:products_composition])

    respond_to do |format|
      if @products_composition.save
        format.html { render action: 'show', :layout => "default" , notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /products/compositions/1
  # PUT /products/compositions/1.json
  def update
    @products_composition = Products::Composition.find(params[:id])

    respond_to do |format|
      if @products_composition.update_attributes(params[:products_composition])
        format.html { render action: 'show', :layout => "default" , notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /products/compositions/1
  # DELETE /products/compositions/1.json
  def destroy
    @products_composition = Products::Composition.find(params[:id])
    
#    if @products_composition.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to products_compositions_path, notice: 'No se puede eliminar el registro "'+@products_composition.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @products_composition.destroy

    respond_to do |format|
      format.html { redirect_to  products_compositions_path }
    end
  end
end
