class Orders::ProductionsController < ApplicationController
  # GET /orders/productions
  # GET /orders/productions.json
  
  layout "dialog"

  def list
    @orders_productions = Orders::Production.paginate(:page => params[:page])
    delete_if_void @orders_productions
    @orders_productions = Orders::Production.paginate(:page => params[:page], :order => "created_at DESC")
  end

  def index
    list  
    @title = "Ordenes de producci&oacute;n"
    respond_to do |format|
      format.js
      format.pdf {
        @orders_productions = Orders::Production.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/orders/productions/index.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'pdf.html.erb' 
      }     
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
    @orders_production.status = @default_status
    create 
#    respond_to do |format|
#      format.js # new.html.erb
#    end
  end

  # GET /orders/productions/1/edit
  def edit
    @orders_production = Orders::Production.find(params[:id])
  end

  # POST /orders/productions
  # POST /orders/productions.json
  def create
    #@orders_production = Orders::Production.new(params[:orders_production])
    @orders_production.user = current_user
    respond_to do |format|
      if @orders_production.save
        format.js { render action: 'show'  }
      else
        format.js { 
        render action: "new"}
      end
    end
  end

  def else_update
    respond_to do |format|
      if @orders_production.update_attributes(params[:orders_production])
        if @default_status == @orders_production.status
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

  # PUT /orders/productions/1
  # PUT /orders/productions/1.json
  def update
    @orders_production = Orders::Production.find(params[:id])
    status_id = params[:orders_production][:status_id]
    if status_id == @close_status.id
      if ! @orders_production.close
        respond_to do |format|
          format.js { 
             @notice = "No se puede cambiar el estado a "+@close_status.name+", probablemente las cantidades sean incoherentes"
             render action: "edit"
          }
        end
      else else_update end
    else else_update end
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
