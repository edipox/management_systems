class Settings::PermissionsController < ApplicationController
  def index
    @roles = ACL::Role.all
  end

  def save
    permissions_ids = params[:permissions]
    permissions_ids.each do |_, permission|
      p = ACL::Permission.find(permission[:id])
      p.enabled = permission[:enabled] == 'on'
      p.save
    end

    redirect_to settings_permissions_path
  end
end
