class StockController < ApplicationController
  def index
  end

  def components
    @components_items = Components::Item.paginate(:page => params[:page])
  end
end
