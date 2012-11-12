class Components::Categories::KindsController < ApplicationController
  # GET /components/categories/kinds
  # GET /components/categories/kinds.json
  
  layout "dialog"

  def index
    @components_categories_kinds = Components::Categories::Kind.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /components/categories/kinds/1
  # GET /components/categories/kinds/1.json
  def show
    @components_categories_kind = Components::Categories::Kind.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /components/categories/kinds/new
  # GET /components/categories/kinds/new.json
  def new
    @components_categories_kind = Components::Categories::Kind.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /components/categories/kinds/1/edit
  def edit
    @components_categories_kind = Components::Categories::Kind.find(params[:id])
  end

  # POST /components/categories/kinds
  # POST /components/categories/kinds.json
  def create
    @components_categories_kind = Components::Categories::Kind.new(params[:components_categories_kind])

    respond_to do |format|
      if @components_categories_kind.save
        format.html { redirect_to components_categories_kinds_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /components/categories/kinds/1
  # PUT /components/categories/kinds/1.json
  def update
    @components_categories_kind = Components::Categories::Kind.find(params[:id])

    respond_to do |format|
      if @components_categories_kind.update_attributes(params[:components_categories_kind])
        format.html { redirect_to components_categories_kinds_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /components/categories/kinds/1
  # DELETE /components/categories/kinds/1.json
  def destroy
    @components_categories_kind = Components::Categories::Kind.find(params[:id])
    
#    if @components_categories_kind.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to components_categories_kinds_path, notice: 'No se puede eliminar el registro "'+@components_categories_kind.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @components_categories_kind.destroy

    respond_to do |format|
      format.html { redirect_to  components_categories_kinds_path }
    end
  end
end
