class ApplicationController < ActionController::Base
  protect_from_forgery
  
  WillPaginate.per_page = 7

  before_filter :authenticate_user!
  def index
  end
  
  def delete_if_void list
    default_status = Transactions::Status.where("name = 'Abierta'")[0].id
    original_list = list
    
    
    list.each do |element|
      if element.created_at != element.updated_at
        will_destroy = true
        atts = element.attributes
        atts.each do |a|
          attribute = a[0]
          value = a[1]
          if attribute != "created_at" &&  attribute != "updated_at" &&  attribute != "user_id" && attribute != "id" && attribute != "transaction_id" && !(attribute == "status_id" && value == default_status) && value != ""  && value != nil
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
