class Stock::ProductionController < ApplicationController
  layout "stock_production"
  def index
  end

  def transactions
    @transactions =nil# Stocks::Transactions::Production.paginate(:page => params[:page])
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
