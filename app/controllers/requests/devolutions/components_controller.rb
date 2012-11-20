class Requests::Devolutions::ComponentsController < ApplicationController
  # GET /requests/devolutions/components
  # GET /requests/devolutions/components.json
  
  layout "dialog"

  def list
    @requests_devolutions_components = Requests::Devolutions::Component.paginate(:page => params[:page])
    delete_if_void @requests_devolutions_components
    @requests_devolutions_components = Requests::Devolutions::Component.paginate(:page => params[:page])
  end

  def index
    list  
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/devolutions/components/1
  # GET /requests/devolutions/components/1.json
  def show
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  # GET /requests/devolutions/components/new
  # GET /requests/devolutions/components/new.json
  def new
    @requests_devolutions_component = Requests::Devolutions::Component.new
    @hide_status_select = true
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /requests/devolutions/components/1/edit
  def edit
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
  end

  # POST /requests/devolutions/components
  # POST /requests/devolutions/components.json
  def create
    @requests_devolutions_component = Requests::Devolutions::Component.new(params[:requests_devolutions_component])
    @requests_devolutions_component.status = get_default_status
    transaction = Stocks::Transactions::Component.new
    transaction.kind = "Requests::Devolutions::Component"
    @requests_devolutions_component.user = current_user
    @requests_devolutions_component.transaction_id = "nil"
    @requests_devolutions_component.save
    transaction.kind_id = @requests_devolutions_component.id
    transaction.save
    @requests_devolutions_component.transaction = transaction
    respond_to do |format|
      if @requests_devolutions_component.save
        format.js { render action: 'show' }
      else
        format.js { @notice =  'Error al guardar el registro.'
        render action: "new" }
      end
    end
  end

  # PUT /requests/devolutions/components/1
  # PUT /requests/devolutions/components/1.json
  def update
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
    @requests_devolutions_component.user = current_user
    respond_to do |format|
      if @requests_devolutions_component.update_attributes(params[:requests_devolutions_component])
        if @default_status == @requests_devolutions_component.status
          format.js {  @notice =  'Registro guardado correctamente.' 
          render action: 'show'}
        else
          list
          format.js {  @notice =  'Registro guardado correctamente.' 
          render action: 'index'}
        end
      else
        format.js { 
        @notice = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /requests/devolutions/components/1
  # DELETE /requests/devolutions/components/1.json
  def destroy
    @requests_devolutions_component = Requests::Devolutions::Component.find(params[:id])
    @requests_devolutions_component.destroy
    list
    respond_to do |format|
      format.js { render 'index' }
    end
  end
end
