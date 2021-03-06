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
    @components = Components::Item.paginate(:page => params[:page])
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
end
