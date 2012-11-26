class Requests::Purchases::ComponentsController < ApplicationController
  # GET /requests/purchases/components
  # GET /requests/purchases/components.json
  
  layout "dialog"

  def list
    @requests_purchases_components = Requests::Purchases::Component.paginate(:page => params[:page])
    delete_if_void @requests_purchases_components
    @requests_purchases_components = Requests::Purchases::Component.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/purchases/components/1
  # GET /requests/purchases/components/1.json
  def show
    @requests_purchases_component = Requests::Purchases::Component.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/purchases/components/new
  # GET /requests/purchases/components/new.json
  def new
    @requests_purchases_component = Requests::Purchases::Component.new
    @requests_purchases_component.status = @default_status
    create
#    respond_to do |format|
#      format.js # new.html.erb
#    end
  end

  # GET /requests/purchases/components/1/edit
  def edit
    @requests_purchases_component = Requests::Purchases::Component.find(params[:id])
  end

  # POST /requests/purchases/components
  # POST /requests/purchases/components.json
  def create
    #@requests_purchases_component = Requests::Purchases::Component.new(params[:requests_purchases_component])
    transaction = Stocks::Transactions::Component.new
    transaction.kind = "Requests::Purchases::Component"
    @requests_purchases_component.user = current_user
    @requests_purchases_component.transaction_id = "nil"
    @requests_purchases_component.save
    transaction.kind_id = @requests_purchases_component.id
    transaction.save
    @requests_purchases_component.transaction = transaction
    respond_to do |format|
      if @requests_purchases_component.save
        format.js { render action: 'show'  }
      else
        format.js { @notice = 'Error al guardar el registro.' 
        render action: "new"}
      end
    end
  end
  
  def else_update
    respond_to do |format|
      if @requests_purchases_component.update_attributes(params[:requests_purchases_component])
        if @default_status == @requests_purchases_component.status
          format.js { @notice = 'Registro guardado correctamente.'
          render action: 'show' }
        else
          list
          format.js { 
          @notice = "Error al actualizar el registro"
          render action: "index" }
        end
      else
        format.js { 
        @notice = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # PUT /requests/purchases/components/1
  # PUT /requests/purchases/components/1.json
  def update
    @requests_purchases_component = Requests::Purchases::Component.find(params[:id])
    status_id = params[:requests_purchases_component][:status_id]
    if status_id == @close_status.id
      if ! @requests_purchases_component.close
        respond_to do |format|
          format.js { 
             @notice = "No se puede cambiar el estado a "+@close_status.name+", probablemente las cantidades sean incoherentes"
             render action: "edit"
          }
        end
      else else_update end
    else else_update end
  end

  # DELETE /requests/purchases/components/1
  # DELETE /requests/purchases/components/1.json
  def destroy
    @requests_purchases_component = Requests::Purchases::Component.find(params[:id])
    @requests_purchases_component.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
