require 'will_paginate/array'
class ActivityController < ApplicationController
  def index
    WillPaginate.per_page = 8 
    @versions = Version.order(:created_at).reverse.paginate(:page => params[:page])
    
    respond_to do |format|
      format.js
    end
  end

  def show
    version = Version.find(params[:id])
    version_class = version.item_type.constantize
    if version_class.respond_to? :with_deleted
      version_class = version_class.with_deleted
    end
    @current = version_class.find version.item_id
    @versioned = version.reify

    respond_to do |format|
      format.js { render 'show' }
    end
  end
end
