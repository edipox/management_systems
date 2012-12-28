module ApplicationHelper

  def can_modify?(obj)
    detail_class = (obj.class.to_s+"s::Detail").constantize
    if ( (obj.user == @system_user) && (current_user.role != @system_user.role) ) || obj.status == @close_status 
      current_ability.cannot :edit, obj
      current_ability.cannot :delete, obj
      current_ability.cannot :delete, detail_class
      current_ability.cannot :edit, detail_class
      current_ability.cannot :create, detail_class
      return false
    end
    if obj.status != @default_status
      current_ability.cannot :delete, obj
      current_ability.cannot :delete, detail_class
      current_ability.cannot :create, detail_class
      current_ability.cannot :edit, detail_class
      return false
    end
    return true
  end
  
  def wicked_pdf_image_tag_for_public(img, options={})
    if img[0] == "/"
      new_image = img.slice(1..-1)
      image_tag "file://#{Rails.root.join('public', new_image)}", options
    else
      image_tag "file://#{Rails.root.join('public', 'images', img)}", options
    end
  end
  
end
