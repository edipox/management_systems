class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!
  prepend_before_filter :require_no_authentication, :only => []
  before_filter :authenticate_user!

  def initialize
    super
    @roles = ACL::Role.all    
  end
end
