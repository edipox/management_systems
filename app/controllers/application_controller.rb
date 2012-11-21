class ApplicationController < ActionController::Base
  protect_from_forgery
  
  WillPaginate.per_page = 7

  before_filter :authenticate_user!, :get_default_status, :get_reject_status, :get_close_status, :get_system_user
  def index
  end

  def get_default_status
    @default_status = Transactions::Status.find(AppConfig.find('open_status_id').value)
  end
  
  def get_reject_status
    @reject_status =  Transactions::Status.find(AppConfig.find('reject_status_id').value)
  end
  
  def get_close_status
    @close_status =  Transactions::Status.find(AppConfig.find('close_status_id').value)
  end
  
  def get_system_user
    @system_user = User.find(AppConfig.find('system_user_id').value)
  end
  
  def delete_if_void list
    default_status = get_default_status.id
    list.each do |element|
      if element.created_at != element.updated_at
        will_destroy = true
        atts = element.attributes
        atts.each do |a|
          attribute = a[0]
          value = a[1]
          if attribute != "created_at" && attribute != 'number' &&  attribute != "updated_at" &&  attribute != "user_id" && attribute != "id" && attribute != "transaction_id" && !(attribute == "status_id" && value == default_status) && value != ""  && value != nil
            will_destroy = false
          end
        end
        if will_destroy && element.details == []
          element.destroy
        end
      end
    end
    
  end
  
end
