class Stock::ProductsController < ApplicationController
  layout "stock_products"
  def index
    @existances = Stocks::Product.paginate(:page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
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
    end
  end
  
  def list_components
    @components = Components::Item.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end
    
end
