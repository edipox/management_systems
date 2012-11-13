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
    @transactions = Stocks::Transactions::Product.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

end
