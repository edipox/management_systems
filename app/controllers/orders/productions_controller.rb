class Orders::ProductionsController < ApplicationController
  # GET /orders/productions
  # GET /orders/productions.json
  
  layout "dialog"

  def index
    @orders_productions = Orders::Production.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /orders/productions/1
  # GET /orders/productions/1.json
  def show
    @orders_production = Orders::Production.find(params[:id])
    respond_to do |format|
      format.html{ render 'show', :layout => "default" } # show.html.erb
    end
  end

  # GET /orders/productions/new
  # GET /orders/productions/new.json
  def new
    @orders_production = Orders::Production.new
    respond_to do |format|
      format.html # new.html.erb
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

    respond_to do |format|
      if @orders_production.save
        format.html { render action: 'show', :layout => "default" , notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /orders/productions/1
  # PUT /orders/productions/1.json
  def update
    @orders_production = Orders::Production.find(params[:id])

    respond_to do |format|
      if @orders_production.update_attributes(params[:orders_production])
        format.html { render action: 'show', :layout => "default" , notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /orders/productions/1
  # DELETE /orders/productions/1.json
  def destroy
    @orders_production = Orders::Production.find(params[:id])
    
#    if @orders_production.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to orders_productions_path, notice: 'No se puede eliminar el registro "'+@orders_production.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @orders_production.destroy

    respond_to do |format|
      format.html { redirect_to  orders_productions_path }
    end
  end
end
