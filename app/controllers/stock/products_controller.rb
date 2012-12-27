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
    @products = Products::Composition.paginate(:page => params[:page])
    respond_to do |format|
      format.js
      format.pdf {
          render :pdf => "file_name", 
          :template => '/stock/products/_list_products.html.haml',
          :layout => 'special_pdf.html.erb'
      }     
    end
  end
  
  def list_components
    @components = Components::Item.get_finished.paginate(:page => params[:page])
    respond_to do |format|
      format.js
      format.pdf {
          render :pdf => "file_name", 
          :template => '/stock/products/_list_components.html.haml',
          :layout => 'special_pdf.html.erb'
      }     
    end
  end
    
end
