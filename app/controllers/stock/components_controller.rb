class Stock::ComponentsController < ApplicationController
  layout "stock_components"
  def index

  end
  
  def list
    @components = Components::Item.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  def transactions
    @transactions = Stocks::Transactions::Component.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

end
