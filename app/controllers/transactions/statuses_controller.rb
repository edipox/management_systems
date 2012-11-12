class Transactions::StatusesController < ApplicationController
  # GET /transactions/statuses
  # GET /transactions/statuses.json
  
  layout "dialog"

  def index
    @transactions_statuses = Transactions::Status.paginate(:page => params[:page])
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
    end
  end

  # GET /transactions/statuses/1
  # GET /transactions/statuses/1.json
  def show
    @transactions_status = Transactions::Status.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /transactions/statuses/new
  # GET /transactions/statuses/new.json
  def new
    @transactions_status = Transactions::Status.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /transactions/statuses/1/edit
  def edit
    @transactions_status = Transactions::Status.find(params[:id])
  end

  # POST /transactions/statuses
  # POST /transactions/statuses.json
  def create
    @transactions_status = Transactions::Status.new(params[:transactions_status])

    respond_to do |format|
      if @transactions_status.save
        format.html { redirect_to transactions_statuses_path, notice: 'Registro guardado correctamente.' 
        }
      else
        format.html { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /transactions/statuses/1
  # PUT /transactions/statuses/1.json
  def update
    @transactions_status = Transactions::Status.find(params[:id])

    respond_to do |format|
      if @transactions_status.update_attributes(params[:transactions_status])
        format.html { redirect_to transactions_statuses_path, notice: 'Registro actualizado correctamente.' 
        }
      else
        format.html { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /transactions/statuses/1
  # DELETE /transactions/statuses/1.json
  def destroy
    @transactions_status = Transactions::Status.find(params[:id])
    
#    if @transactions_status.components_items != []
#      respond_to do |format|
#        format.html { 
#          redirect_to transactions_statuses_path, notice: 'No se puede eliminar el registro "'+@transactions_status.name+'", porque existen registros relacionados.' 
#           }
#      end 
#    else
    
    @transactions_status.destroy

    respond_to do |format|
      format.html { redirect_to  transactions_statuses_path }
    end
  end
end
