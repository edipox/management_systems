class EntryController < ApplicationController
 
  def index
  
    @entries = Accounting::Entry.paginate(:page => params[:page], :per_page => 4)
    @title = "Asientos contables"
    respond_to do |format|
      format.js
      format.pdf {
          @title = "Asientos contables"
          @entries = Accounting::Entry.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/entry/index.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'special_pdf.html.erb'
      }     
    end  
  end
  
  
  def show

  end
  
end
