class Components::CategoriesController < ApplicationController
  # GET /components/categories
  # GET /components/categories.json
  layout "dialog"
  
  def index
    @components_categories = Components::Category.all
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
      format.js
      format.json { render json: @components_categories }
    end
  end

  # GET /components/categories/1
  # GET /components/categories/1.json
  def show
    @components_category = Components::Category.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @components_category }
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
      format.html
    end
  end

  # POST /components/categories
  # POST /components/categories.json
  def create
    @components_category = Components::Category.new(params[:components_category])
    respond_to do |format|
      if @components_category.save
        format.html { 
            redirect_to components_categories_path, notice: 'Category was successfully created.' 
        }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /components/categories/1
  # PUT /components/categories/1.json
  def update
    @components_category = Components::Category.find(params[:id])

    respond_to do |format|
      if @components_category.update_attributes(params[:components_category])
        format.html { 
            redirect_to components_categories_path, notice: 'Category was successfully created.' 
        }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /components/categories/1
  # DELETE /components/categories/1.json
  def destroy
    @components_category = Components::Category.find(params[:id])
    @components_category.destroy
    respond_to do |format|
      format.html { redirect_to components_categories_url }
      format.json { head :no_content }
      format.js {     
          # Variable utilizada para re renderizar index
          @components_categories = Components::Category.all;
          render action: "index"
      }
    end
  end
end
