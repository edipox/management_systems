class Stock::RawMaterialController < ApplicationController
  def index

  end
  
  def list
    @components = Components::Item.paginate(:page => params[:page])
    @title = "Existencia en stock de materia prima"
    respond_to do |format|
      format.js
      format.pdf {
        @components = Components::Item.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/stock/raw_material/_list.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'special_pdf.html.erb'
      }     
    end
  end

  def transactions
    @transactions = Transaction.where("from_stock = ? OR to_stock = ?", Stocks::Component.to_s, Stocks::Component.to_s).paginate(:page => params[:page])
    respond_to do |format|
      format.js
    end
  end

end
