class EntryController < ApplicationController
 
  def index
  
    @entries = Accounting::Entry.paginate(:page => params[:page], :per_page => 4)
    respond_to do |format|
      format.js
      format.pdf {
          @title = "Asientos contables"
          @entries = Accounting::Entry.paginate(:page => params[:page], :per_page => 999)
          render :pdf => "file_name", 
          :template => '/entry/index.html.haml',
          :layout => 'special_pdf.html.erb'
      }     
    end  
  end
  
  
  def show

  end
  
end
