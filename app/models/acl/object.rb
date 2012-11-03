module ACL
  class Object < ActiveRecord::Base
    attr_accessible :const, :name
    after_create ::ACL::ObjectCallback.new

    has_many :permissions
  end
end
