class Stock::RawMaterialController < ApplicationController
  def index

  end
  
  def list
    @components = Components::Item.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

  def transactions
    @transactions = nil#Stocks::Transactions::Component.paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

end
