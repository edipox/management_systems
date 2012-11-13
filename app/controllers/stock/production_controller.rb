class Stock::ProductionController < ApplicationController
  layout "stock_production"
  def index
    @existances = Stocks::Production.paginate(:page => params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def transactions
    @transactions = Stocks::Transactions::Production.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

end
