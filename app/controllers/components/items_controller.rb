class Components::ItemsController < ApplicationController
  # GET /components/items
  # GET /components/items.json
  def index
    @components_items = Components::Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @components_items }
    end
  end

  # GET /components/items/1
  # GET /components/items/1.json
  def show
    @components_item = Components::Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @components_item }
    end
  end

  # GET /components/items/new
  # GET /components/items/new.json
  def new
    @components_item = Components::Item.new

    respond_to do |format|
      format.html { render 'new', :layout => false }# new.html.erb
#      format.json { render json: @components_item }
#      format.js
    end
  end

  # GET /components/items/1/edit
  def edit
    @components_item = Components::Item.find(params[:id])
  end

  # POST /components/items
  # POST /components/items.json
  def create
    @components_item = Components::Item.new(params[:components_item])

    respond_to do |format|
      if @components_item.save
        format.html { redirect_to @components_item, notice: 'Item was successfully created.' }
        format.json { render json: @components_item, status: :created, location: @components_item }
      else
        format.html { render action: "new" }
        format.json { render json: @components_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /components/items/1
  # PUT /components/items/1.json
  def update
    @components_item = Components::Item.find(params[:id])

    respond_to do |format|
      if @components_item.update_attributes(params[:components_item])
        format.html { redirect_to @components_item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @components_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /components/items/1
  # DELETE /components/items/1.json
  def destroy
    @components_item = Components::Item.find(params[:id])
    @components_item.destroy

    respond_to do |format|
      format.html { redirect_to components_items_url }
      format.json { head :no_content }
    end
  end
end
