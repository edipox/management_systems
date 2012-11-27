class EntryController < ApplicationController
 
  def index
  
    @entries = Accounting::Entry.paginate(:page => params[:page], :per_page => 4)
    respond_to do |format|
      format.js
    end
  end
  
  
  def show

  end
  
end
