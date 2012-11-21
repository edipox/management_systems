class Requests::Transferences::ComponentsController < ApplicationController
  # GET /requests/transferences/components
  # GET /requests/transferences/components.json
  
  layout "dialog"

  def list
    @requests_transferences_components = Requests::Transferences::Component.paginate(:page => params[:page])
    delete_if_void @requests_transferences_components
    @requests_transferences_components = Requests::Transferences::Component.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/transferences/components/1
  # GET /requests/transferences/components/1.json
  def show
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/transferences/components/new
  # GET /requests/transferences/components/new.json
  def new
    @requests_transferences_component = Requests::Transferences::Component.new
    @requests_transferences_component.status = @default_status
    create    
#    respond_to do |format|
#      format.js # new.html.erb
#    end
  end

  # GET /requests/transferences/components/1/edit
  def edit
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])
  end

  # POST /requests/transferences/components
  # POST /requests/transferences/components.json
  def create
    #@requests_transferences_component = Requests::Transferences::Component.new(params[:requests_transferences_component])
    transaction = Stocks::Transactions::Production.new
    transaction.kind = "Requests::Transferences::Component"
    @requests_transferences_component.user = current_user
    @requests_transferences_component.transaction_id = 'nil'
    @requests_transferences_component.save
    transaction.kind_id = @requests_transferences_component.id
    transaction.save
    @requests_transferences_component.transaction = transaction
    respond_to do |format|
      if @requests_transferences_component.save
        format.js {  render action: 'show' }
      else
        format.js {  @notice = 'Error al guardar el registro.' 
        render action: "new"}
      end
    end
  end

  def else_update
    respond_to do |format|
        if @requests_transferences_component.update_attributes(params[:requests_transferences_component])
          if @default_status == @requests_transferences_component.status
            format.js {  @notice = 'Registro guardado correctamente.' 
            render action: 'show'}
          else
            list
            format.js {  @notice = 'Registro guardado correctamente.' 
            render action: 'index'}
          end
        else
          format.js { 
          @notice = "Error al actualizar el registro"
          render action: "edit" }
        end
    end
  end

  # PUT /requests/transferences/components/1
  # PUT /requests/transferences/components/1.json
  def update
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])
    status_id = params[:requests_transferences_component][:status_id]
    if status_id == @close_status.id
      if ! @requests_transferences_component.close
        respond_to do |format|
          format.js { 
             @notice = "No se puede cambiar el estado a "+@close_status.name+", probablemente las cantidades sean incoherentes"
             render action: "edit"
          }
        end
      else else_update end
    else else_update end
  end

  # DELETE /requests/transferences/components/1
  # DELETE /requests/transferences/components/1.json
  def destroy
    @requests_transferences_component = Requests::Transferences::Component.find(params[:id])
    @requests_transferences_component.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
