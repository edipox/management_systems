class Components::Item < ActiveRecord::Base
  attr_accessible :components_category, :components_category_id, :code, :description, :name
  belongs_to :components_category, :class_name => "Components::Category"
end
