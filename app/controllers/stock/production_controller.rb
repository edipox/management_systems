class Stock::ProductionController < ApplicationController
  layout "stock_production"
  def index
  end

  def transactions
    @transactions = Transaction.where("from_stock = ? OR to_stock = ?", Stocks::Production.to_s, Stocks::Production.to_s).paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  def list_components
    @title = "Existencia de componentes en stock de producci&oacute;n"
    @components = Components::Item.paginate(:page => params[:page])
    respond_to do |format|
      format.js
      format.pdf {
        @components = Components::Item.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/stock/production/_list_components.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'special_pdf.html.erb'
      }     
    end
  end
  
  
  def list_products
    @title = "Existencia de productos en stock de producci&oacute;n"
    @products = Products::Composition.paginate(:page => params[:page])
    respond_to do |format|
      format.js
      format.pdf {
        @products = Products::Composition.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/stock/production/_list_products.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'special_pdf.html.erb'
      }     
    end
  end
end
