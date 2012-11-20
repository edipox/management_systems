class Products::CompositionsController < ApplicationController
  # GET /products/compositions
  # GET /products/compositions.json
  
  layout "dialog"

  def list
    @products_compositions = Products::Composition.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /products/compositions/1
  # GET /products/compositions/1.json
  def show
    @products_composition = Products::Composition.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /products/compositions/new
  # GET /products/compositions/new.json
  def new
    @products_composition = Products::Composition.new
    respond_to do |format|
      format.js # new.html.erb
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
        format.js { @notice = 'Registro actualizado correctamente.' 
        render action: 'show'}
      else
        format.js { @notice = 'Error al guardar el registro.' 
        render action: "new"}
      end
    end
  end

  # PUT /products/compositions/1
  # PUT /products/compositions/1.json
  def update
    @products_composition = Products::Composition.find(params[:id])

    respond_to do |format|
      if @products_composition.update_attributes(params[:products_composition])
        format.js { render action: 'show'; @notice = 'Registro guardado correctamente.' }
      else
        format.js { 
        @notice = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /products/compositions/1
  # DELETE /products/compositions/1.json
  def destroy
    @products_composition = Products::Composition.find(params[:id])
    @products_composition.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
