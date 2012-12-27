class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page])
    respond_to do |format|
      format.js
      format.pdf {
          render :pdf => "file_name", 
          :template => '/users/index.html.haml',
          :layout => 'pdf.html.erb' 
      }     
    end  
  end
end
