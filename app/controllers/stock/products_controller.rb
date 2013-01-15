class Stock::ProductsController < ApplicationController
  require "will_paginate/array"
  layout "stock_products"
  def index
    @existances = Stocks::Product.paginate(:page => params[:page])
  end

  def transactions
    @transactions = Transaction.where("from_stock = ? OR to_stock = ?", Stocks::Product.to_s, Stocks::Product.to_s).paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end
  
  def list_products
    @title = "Existencia de productos en stock de productos terminados"
    @products = Products::Composition.paginate(:page => params[:page])
    respond_to do |format|
      format.js
      format.pdf {
        @products = Products::Composition.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/stock/products/_list_products.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'special_pdf.html.erb'
      }     
    end
  end
  
  def list_components
    @title = "Existencia de componentes en stock de productos terminados"
    @components = Components::Item.get_finished.paginate(:page => params[:page])
    respond_to do |format|
      format.js
      format.pdf {
        @components = Components::Item.get_finished.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/stock/products/_list_components.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'special_pdf.html.erb'
      }     
    end
  end
    
end
