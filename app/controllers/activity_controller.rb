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
    
    next_version = Version.where("id > :id and item_id = :item_id", {id: version.id, item_id: version.item_id}).first
    
    if next_version
      @current = next_version.reify
    else
      @current = version_class.find version.item_id
    end
    
    @versioned = version.reify

    respond_to do |format|
      format.js { render 'show' }
    end
  end
end
