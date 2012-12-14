class Settings::PermissionsController < ApplicationController
=begin
  def index
    @roles = ACL::Role.order(:created_at).all
    respond_to { |format| format.js }
  end
=end

  def save
    permissions_ids = params[:permissions]
    permissions_ids.each do |_, permission|
      p = ACL::Permission.find(permission[:id])
      p.enabled = permission[:enabled] == 'on'
      p.save
    end

    respond_to { |format| format.js }

    #respond_to do |format|
    #  format.js
    #end

#    redirect_to "/settings/permissions/#{params[:role_id]}", :format => :js
  end

  def of_role
    @role = ACL::Role.find(params[:role_id])
    permissions = @role.permissions.order(:created_at, :entidad_id)
    
    @permissions_by_entity = {}
    permissions.each do |permission|
      hash_id = permission.entity.id 
      @permissions_by_entity[hash_id] = [] if @permissions_by_entity[hash_id].nil?
      @permissions_by_entity[hash_id] << permission
    end
    
    respond_to { |format| format.js }
  end
end
