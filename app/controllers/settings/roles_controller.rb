class Settings::RolesController < ApplicationController
  layout 'settings'

  # GET /settings/roles
  # GET /settings/roles.json
  def index
    @roles = ACL::Role.all
    respond_to { |format| format.js }
  end

  def show
    raise 'Settings::RolesController#show'
  end

  # GET /settings/roles/new
  def new
    @role = ACL::Role.new
    respond_to { |format| format.js }
  end

  # GET /settings/roles/1/edit
  def edit
    @role = ACL::Role.find(params[:id])
    respond_to { |format| format.js }
  end

  # POST /settings/roles
  # POST /settings/roles.json
  def create
    @role = ACL::Role.create!({
      name: params[:role][:name]
    })
    @roles = ACL::Role.all
    
    respond_to do |format|
      format.js
    end
  end

  # PUT /settings/roles/1
  # PUT /settings/roles/1.json
  def update
    @role = ACL::Role.find(params[:id])
    @role.update_attributes(params[:role])
    @roles = ACL::Role.all
    respond_to do |format|
      format.js
    end
  end

  # DELETE /settings/roles/1
  # DELETE /settings/roles/1.json
  def destroy
    raise 'Settings::RolesControles#destroy'
  end
end
