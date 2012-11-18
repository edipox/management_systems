class Products::Compositions::DetailsController < ApplicationController
  # GET /products/compositions/details
  # GET /products/compositions/details.json
  
  layout "default"

  def index
    @products_compositions_details = Products::Compositions::Detail.paginate(:page => params[:page])
    respond_to do |format|
      format.html
    end
  end

  # GET /products/compositions/details/1
  # GET /products/compositions/details/1.json
  def show
    @products_compositions_detail = Products::Compositions::Detail.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # GET /products/compositions/details/new
  # GET /products/compositions/details/new.json
  def new
    @products_compositions_detail = Products::Compositions::Detail.new
    @products_composition = Products::Composition.find(params["header_id"])
    @products_compositions_details = @products_composition.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js{ render 'update_list_form' }
    end
  end

  # GET /products/compositions/details/1/edit
  def edit
    @products_compositions_detail = Products::Compositions::Detail.find(params[:id])
    @products_composition = @products_compositions_detail.products_composition;
    @products_compositions_details = @products_composition.details.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  # POST /products/compositions/details
  # POST /products/compositions/details.json
  def create
    @products_compositions_detail = Products::Compositions::Detail.new(params[:products_compositions_detail])
    @products_compositions_detail.products_composition = Products::Composition.find(params["header_id"])
    @products_compositions_details = @products_compositions_detail.products_composition.details.paginate(:page => params[:page])
    respond_to do |format|
      if @products_compositions_detail.save
        format.js{ 
          @products_composition = @products_compositions_detail.products_composition
          @products_compositions_detail = Products::Compositions::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { redirect_to :back, notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /products/compositions/details/1
  # PUT /products/compositions/details/1.json
  def update
    @products_compositions_detail = Products::Compositions::Detail.find(params[:id])
    @products_composition = @products_compositions_detail.products_composition;
    @products_compositions_details = @products_composition.details.paginate(:page => params[:page])
    respond_to do |format|
      if @products_compositions_detail.update_attributes(params[:products_compositions_detail])
        format.js{ 
          @products_compositions_detail = Products::Compositions::Detail.new
          render 'update_list_form' 
         }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        redirect_to :back }
      end
    end
  end

  def destroy
    @products_compositions_detail = Products::Compositions::Detail.find(params[:id])
    @products_composition = @products_compositions_detail.products_composition
    @products_compositions_details = @products_composition.details.paginate(:page => params[:page])
    @products_compositions_detail.destroy
    respond_to do |format|
        format.js{ 
          @products_compositions_detail =  Products::Compositions::Detail.new
          render 'update_list' 
         }
    end
  end
end

