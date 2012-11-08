class Components::ItemsController < ApplicationController
  # GET /components/items
  # GET /components/items.json
  layout "dialog"
  
  def index
    @components_items = Components::Item.all
    respond_to do |format|
      format.html{ render 'index', :layout => "default" }
      format.js
      format.json { render json: @components_items }
    end
  end

  # GET /components/items/1
  # GET /components/items/1.json
  def show
    @components_item = Components::Item.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @components_item }
      format.js
    end
  end

  # GET /components/items/new
  # GET /components/items/new.json
  def new
    @components_item = Components::Item.new
    respond_to do |format|
      format.html{
        flash[:notice] = nil
      }
      format.js
    end
  end

  # GET /components/items/1/edit
  def edit
    @components_item = Components::Item.find(params[:id])
  end

  # POST /components/items
  # POST /components/items.json
  def create
    @components_item = Components::Item.new(params[:components_item])
    
    category_name = params[:category_name];
    category_description = params[:category_description];

    if category_name != "" && category_description != ""
      category = Components::Category.new;
      category.name = category_name;
      category.description = category_description;

      if category.save
        @components_item.category_id = category.id;
      end
    end

    respond_to do |format|
      
      if @components_item.category_id == nil
            format.html { 
            flash[:notice] = "Error al crear componente. Categoria vacia."
            render action: 'new'   }
      else
        if @components_item.save
          format.html { 
            redirect_to components_items_path, notice: 'Componente creado correctamente.'
          }
        else
          format.html { render action: "new", notice: 'Error al crear componente.'  }
        end
      end
      
    end
  end

  # PUT /components/items/1
  # PUT /components/items/1.json
  def update
    @components_item = Components::Item.find(params[:id])

    respond_to do |format|
      if @components_item.update_attributes(params[:components_item])
        format.html { 
            redirect_to components_items_path, notice: 'Componente actualizado correctamente.' 
        }
        format.js {     
            # Variable utilizada para re renderizar index
            @components_items = Components::Item.all;
            render action: "index"
        }
      else
        format.html { render action: "edit", notice: 'Error al actualizar componente.'  }
        format.js {     
            # Variable utilizada para re renderizar index
            @components_items = Components::Item.all;
            render action: "index"
        }
      end
    end
  end

  # DELETE /components/items/1
  # DELETE /components/items/1.json
  def destroy
    @components_item = Components::Item.find(params[:id])
    @components_item.destroy
        
    respond_to do |format|
      format.html { redirect_to components_items_url }
      format.json { head :no_content }
      format.js {     
          # Variable utilizada para re renderizar index
          @components_items = Components::Item.all;
          render action: "index"
      }
    end
  end
end
