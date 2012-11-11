class ApplicationController < ActionController::Base
  protect_from_forgery
  
  WillPaginate.per_page = 7

  before_filter :authenticate_user!
  def index
  end
end
