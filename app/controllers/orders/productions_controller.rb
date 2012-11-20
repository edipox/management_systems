class Orders::ProductionsController < ApplicationController
  # GET /orders/productions
  # GET /orders/productions.json
  
  layout "dialog"

  def list
    @orders_productions = Orders::Production.paginate(:page => params[:page])
    delete_if_void @orders_productions
    @orders_productions = Orders::Production.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /orders/productions/1
  # GET /orders/productions/1.json
  def show
    @orders_production = Orders::Production.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /orders/productions/new
  # GET /orders/productions/new.json
  def new
    @orders_production = Orders::Production.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /orders/productions/1/edit
  def edit
    @orders_production = Orders::Production.find(params[:id])
  end

  # POST /orders/productions
  # POST /orders/productions.json
  def create
    @orders_production = Orders::Production.new(params[:orders_production])
    transaction = Stocks::Transactions::Production.new
    transaction.kind = "Orders::Production"
    @orders_production.user_id = "nil"
    @orders_production.transaction_id = "nil"
    @orders_production.save
    transaction.kind_id = @orders_production.id
    transaction.save
    @orders_production.transaction = transaction
    
    respond_to do |format|
      if @orders_production.save
        format.js { @notice = 'Registro actualizado correctamente.'
        render action: 'show' }
      else
        format.js {  @notice = 'Error al guardar el registro.' 
        render action: "new"}
      end
    end
  end

  # PUT /orders/productions/1
  # PUT /orders/productions/1.json
  def update
    @orders_production = Orders::Production.find(params[:id])

    respond_to do |format|
      if @orders_production.update_attributes(params[:orders_production])
        format.js { @notice = 'Registro guardado correctamente.' 
        render action: 'show'}
      else
        format.js { 
        @notice = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /orders/productions/1
  # DELETE /orders/productions/1.json
  def destroy
    @orders_production = Orders::Production.find(params[:id])
    @orders_production.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
