class Components::CategoriesController < ApplicationController
  # GET /components/categories
  # GET /components/categories.json
  def index
    @components_categories = Components::Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @components_categories }
    end
  end

  # GET /components/categories/1
  # GET /components/categories/1.json
  def show
    @components_category = Components::Category.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @components_category }
    end
  end

  # GET /components/categories/new
  # GET /components/categories/new.json
  def new
    @components_category = Components::Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @components_category }
    end
  end

  # GET /components/categories/1/edit
  def edit
    @components_category = Components::Category.find(params[:id])
  end

  # POST /components/categories
  # POST /components/categories.json
  def create
    @components_category = Components::Category.new(params[:components_category])

    respond_to do |format|
      if @components_category.save
        format.html { redirect_to @components_category, notice: 'Category was successfully created.' }
        format.json { render json: @components_category, status: :created, location: @components_category }
      else
        format.html { render action: "new" }
        format.json { render json: @components_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /components/categories/1
  # PUT /components/categories/1.json
  def update
    @components_category = Components::Category.find(params[:id])

    respond_to do |format|
      if @components_category.update_attributes(params[:components_category])
        format.html { redirect_to @components_category, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @components_category.errors, status: :unprocessable_entity }
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
    end
  end
end
