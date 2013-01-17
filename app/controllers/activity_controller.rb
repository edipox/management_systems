require 'will_paginate/array'
class ActivityController < ApplicationController
  def index
    WillPaginate.per_page = 8 
    @versions = Version.order(:created_at).reverse.paginate(:page => params[:page])
    
    respond_to do |format|
      format.js
      format.pdf {
          @title = "Auditor&iacute;a"
          @versions = Version.order(:created_at).reverse.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/activity/_index.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'pdf.html.erb'
      }     
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
