class Transactions::StatusesController < ApplicationController
  # GET /transactions/statuses
  # GET /transactions/statuses.json
  
  layout "dialog"

  def index
    @transactions_statuses = Transactions::Status.paginate(:page => params[:page])
  end

  # GET /transactions/statuses/1
  # GET /transactions/statuses/1.json
  def show
    @transactions_status = Transactions::Status.find(params[:id])
    respond_to do |format|
      format.js # show.html.erb
    end
  end

  # GET /transactions/statuses/new
  # GET /transactions/statuses/new.json
  def new
    @transactions_status = Transactions::Status.new
    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # GET /transactions/statuses/1/edit
  def edit
    @transactions_status = Transactions::Status.find(params[:id])
    respond_to do |format|
      format.js
    end    
  end

  # POST /transactions/statuses
  # POST /transactions/statuses.json
  def create
    @transactions_status = Transactions::Status.new(params[:transactions_status])
    index
    respond_to do |format|
      if @transactions_status.save
        format.js { render 'index', notice: 'Registro guardado correctamente.' 
        }
      else
        format.js { render action: "new", notice: 'Error al guardar el registro.' }
      end
    end
  end

  # PUT /transactions/statuses/1
  # PUT /transactions/statuses/1.json
  def update
    @transactions_status = Transactions::Status.find(params[:id])
    index
    respond_to do |format|
      if @transactions_status.update_attributes(params[:transactions_status])
        format.js { render 'index', notice: 'Registro actualizado correctamente.' 
        }
      else
        format.js { 
        flash[:notice] = "Error al actualizar el registro"
        render action: "edit" }
      end
    end
  end

  # DELETE /transactions/statuses/1
  # DELETE /transactions/statuses/1.json
  def destroy
    @transactions_status = Transactions::Status.find(params[:id])
    @transactions_status.destroy
    respond_to do |format|
      format.js { 
        index
        render  'index'
      }
    end
  end
end
