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
    @transactions = Transaction.where("from_stock = ? OR to_stock = ?", Stocks::Component.to_s, Stocks::Component.to_s).paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

end
