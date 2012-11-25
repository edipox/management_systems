module ApplicationHelper

  def can_modify?(obj)
    detail_class = (obj.class.to_s+"s::Detail").constantize
    puts "*****************************************************************************************************"
    puts obj.status.name
    puts @default_status.name
    if ( (obj.user == @system_user) && (current_user.role != @system_user.role) ) || obj.status == @close_status 
      
      puts "( (obj.user == @system_user) && (current_user.role != @system_user.role) ) || obj.status == @close_status "
      
      current_ability.cannot :edit, obj
      current_ability.cannot :delete, obj
      current_ability.cannot :delete, detail_class
      current_ability.cannot :edit, detail_class
      current_ability.cannot :create, detail_class
      return false
    end
    if obj.status != @default_status
      puts "obj.status != @default_status"
      #current_ability.cannot :delete, obj
      current_ability.cannot :delete, detail_class
      current_ability.cannot :create, detail_class
      current_ability.cannot :edit, detail_class
      return false
    end
    puts "NONE"
    return true
  end
  
end
