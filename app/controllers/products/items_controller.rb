class Products::ItemsController < ApplicationController
  # GET /products/items
  # GET /products/items.json
  
  layout "dialog"

  def index
    @products_items = Products::Item.paginate(:page => params[:page])
  end

  # GET /products/items/1
  # GET /products/items/1.json
  def show
    @products_item = Products::Item.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /products/items/new
  # GET /products/items/new.json
  def new
    @products_item = Products::Item.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /products/items/1/edit
  def edit
    @products_item = Products::Item.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /products/items
  # POST /products/items.json
  def create
    @products_item = Products::Item.new(params[:products_item])
    index
    respond_to do |format|
      if @products_item.save
        format.js { render 'index', notice: 'Registro guardado correctamente.' 
        }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /products/items/1
  # PUT /products/items/1.json
  def update
    @products_item = Products::Item.find(params[:id])
    index
    respond_to do |format|
      if @products_item.update_attributes(params[:products_item])
        format.js { render 'index', notice: 'Registro actualizado correctamente.' 
        }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /products/items/1
  # DELETE /products/items/1.json
  def destroy
    @products_item = Products::Item.find(params[:id])
    @products_item.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
end
