class Components::CategoriesController < ApplicationController
  # GET /components/categories
  # GET /components/categories.json
  def index
    @components_categories = Components::Category.paginate(:page => params[:page])
  end

  # GET /components/categories/1
  # GET /components/categories/1.json
  def show
    @components_category = Components::Category.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /components/categories/new
  # GET /components/categories/new.json
  def new
    @components_category = Components::Category.new
    respond_to do |format|
      format.html
#      format.json { render json: @components_category }
      format.js
    end
  end

  # GET /components/categories/1/edit
  def edit
    @components_category = Components::Category.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # POST /components/categories
  # POST /components/categories.json
  def create
    @components_category = Components::Category.new(params[:components_category])
    index
    respond_to do |format|
      if @components_category.save
        format.js { 
             @notice = 'Categoria creada correctamente.' 
             render 'index'
        }
      else
        format.js { 
        render  "new" }
      end
    end
  end

  # PUT /components/categories/1
  # PUT /components/categories/1.json
  def update
    @components_category = Components::Category.find(params[:id])
    index
    respond_to do |format|
      if @components_category.update_attributes(params[:components_category])
        format.js { 
            @notice = 'Categoria actualizada correctamente' 
            render 'index'
        }
      else
        format.js { 
        @notice = "Error al actualizar categoria"
        render action: "edit" }
      end
    end
  end

  # DELETE /components/categories/1
  # DELETE /components/categories/1.json
  def destroy
    @components_category = Components::Category.find(params[:id])
    if @components_category.components_items != []
      respond_to do |format|
        format.js {     
            @components_categories = Components::Category.paginate(:page => params[:page]);
            @notice = 'No puedes eliminar la categoria "'+@components_category.name+'", porque existen registros relacionados.' 
            render action: "index"
        }
      end 
    else
      @components_category.destroy
      respond_to do |format|
        format.js {     
            #@components_categories = Components::Category.paginate(:page => params[:page]);
            index
            render action: "index"
        }
      end
    end
    
  end
  
  
end
