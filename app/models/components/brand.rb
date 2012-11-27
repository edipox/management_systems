class Components::Brand < ActiveRecord::Base
  acts_as_paranoid
  has_paper_trail
  attr_accessible :description, :name
  validates :name, :presence => true, :uniqueness => true, :length => { :maximum => 36 }
  has_many :components_items, :class_name => Components::Item.to_s
end
