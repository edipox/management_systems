class Requests::Purchases::ComponentsController < ApplicationController
  # GET /requests/purchases/components
  # GET /requests/purchases/components.json
  
  layout "dialog"

  def list
    @requests_purchases_components = Requests::Purchases::Component.paginate(:page => params[:page])
    list = @requests_purchases_components
    list.each do |element|
      will_destroy = true
      atts = element.attributes
      atts.each do |a|
        attribute = a[0]
        value = a[1]
        if attribute != "created_at" &&  attribute != "updated_at" && attribute != "id" && attribute != "transaction_id" if attribute != "status_id" && value != ""  && value != nil
          will_destroy = false
        end
      end
      element.destroy unless !will_destroy || element.details != []
    end
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
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /requests/purchases/components/1/edit
  def edit
    @requests_purchases_component = Requests::Purchases::Component.find(params[:id])
  end

  # POST /requests/purchases/components
  # POST /requests/purchases/components.json
  def create
    @requests_purchases_component = Requests::Purchases::Component.new(params[:requests_purchases_component])
    transaction = Stocks::Transactions::Component.new
    transaction.kind = "Requests::Purchases::Component"
    @requests_purchases_component.user_id = "nil"
    @requests_purchases_component.transaction_id = "nil"
    @requests_purchases_component.save
    transaction.kind_id = @requests_purchases_component.id
    transaction.save
    @requests_purchases_component.transaction = transaction
    
    respond_to do |format|
      if @requests_purchases_component.save
        format.js { render action: 'show', notice: 'Registro actualizado correctamente.' }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /requests/purchases/components/1
  # PUT /requests/purchases/components/1.json
  def update
    @requests_purchases_component = Requests::Purchases::Component.find(params[:id])

    respond_to do |format|
      if @requests_purchases_component.update_attributes(params[:requests_purchases_component])
        format.js { render action: 'show', notice: 'Registro guardado correctamente.' }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
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
