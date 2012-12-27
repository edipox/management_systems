class EntryController < ApplicationController
 
  def index
  
    @entries = Accounting::Entry.paginate(:page => params[:page], :per_page => 4)
    respond_to do |format|
      format.js
      format.pdf {
          render :pdf => "file_name", 
          :template => '/entry/index.html.haml',
          :layout => 'stock_pdf.html.erb' 
      }     
    end  
  end
  
  
  def show

  end
  
end
