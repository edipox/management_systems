require 'will_paginate/array'
class ActivityController < ApplicationController
  def index
    WillPaginate.per_page = 8 
    @versions = Version.order(:created_at).reverse.paginate(:page => params[:page])
  end

  def show
    version = Version.find(params[:id])
    @current = eval "::#{version.item_type}.find '#{version.item_id}'"
    @versioned = version.reify

    respond_to do |format|
      format.any { render 'show', :layout => 'dialog' }
    end
  end
end
