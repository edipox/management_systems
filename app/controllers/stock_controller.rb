class StockController < ApplicationController
  def index
  end

  def components
    @components_items = Components::Item.all
  end
end
