class ComponentesController < ApplicationController
  # GET /componentes
  # GET /componentes.json
  def index
    @componentes = Componente.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @componentes }
    end
  end

  # GET /componentes/1
  # GET /componentes/1.json
  def show
    @componente = Componente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @componente }
    end
  end

  # GET /componentes/new
  # GET /componentes/new.json
  def new
    @componente = Componente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @componente }
    end
  end

  # GET /componentes/1/edit
  def edit
    @componente = Componente.find(params[:id])
  end

  # POST /componentes
  # POST /componentes.json
  def create
    @componente = Componente.new(params[:componente])

    respond_to do |format|
      if @componente.save
        format.html { redirect_to @componente, notice: 'Componente was successfully created.' }
        format.json { render json: @componente, status: :created, location: @componente }
      else
        format.html { render action: "new" }
        format.json { render json: @componente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /componentes/1
  # PUT /componentes/1.json
  def update
    @componente = Componente.find(params[:id])

    respond_to do |format|
      if @componente.update_attributes(params[:componente])
        format.html { redirect_to @componente, notice: 'Componente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @componente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /componentes/1
  # DELETE /componentes/1.json
  def destroy
    @componente = Componente.find(params[:id])
    @componente.destroy

    respond_to do |format|
      format.html { redirect_to componentes_url }
      format.json { head :no_content }
    end
  end
end
