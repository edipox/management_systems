class Components::Item < ActiveRecord::Base
  attr_accessible :category, :code, :description, :name
end
