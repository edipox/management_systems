class Components::Categories::KindsController < ApplicationController
  # GET /components/categories/kinds
  # GET /components/categories/kinds.json
  
  layout "dialog"

  def index
    @components_categories_kinds = Components::Categories::Kind.paginate(:page => params[:page])
  end

  # GET /components/categories/kinds/1
  # GET /components/categories/kinds/1.json
  def show
    @components_categories_kind = Components::Categories::Kind.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /components/categories/kinds/new
  # GET /components/categories/kinds/new.json
  def new
    @components_categories_kind = Components::Categories::Kind.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /components/categories/kinds/1/edit
  def edit
    @components_categories_kind = Components::Categories::Kind.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /components/categories/kinds
  # POST /components/categories/kinds.json
  def create
    @components_categories_kind = Components::Categories::Kind.new(params[:components_categories_kind])
    index
    respond_to do |format|
      if @components_categories_kind.save
        format.js {  @notice = 'Registro guardado correctamente.'; render 'index'
        }
      else
        format.js { render action: "new" }
      end
    end
  end

  # PUT /components/categories/kinds/1
  # PUT /components/categories/kinds/1.json
  def update
    @components_categories_kind = Components::Categories::Kind.find(params[:id])
    index
    respond_to do |format|
      if @components_categories_kind.update_attributes(params[:components_categories_kind])
        format.js { @notice = 'Registro actualizado correctamente.' ;render 'index'
        }
      else
        format.js { 
        @notice = "Error al actualizar el registro";
        render action: "edit" }
      end
    end
  end

  # DELETE /components/categories/kinds/1
  # DELETE /components/categories/kinds/1.json
  def destroy
    @components_categories_kind = Components::Categories::Kind.find(params[:id])
    @components_categories_kind.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
end
