class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page])
    @title = "Usuarios"
    respond_to do |format|
      format.js
      format.pdf {
          @users = User.paginate(:page => params[:page], :per_page => MAX_PER_PAGE)
          render :pdf => "file_name", 
          :template => '/users/index.html.haml',
          :header => { :html =>  { :template => 'pdf/header.pdf' } },
          :layout => 'special_pdf.html.erb' 
      }     
    end  
  end
end
