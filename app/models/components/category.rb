class Components::Category < ActiveRecord::Base
  attr_accessible :description, :name, :finished
  has_many :components_items, :class_name => Components::Item.to_s
  validates :name, :presence => true, :uniqueness => true, :length => { :minimum => 2, :maximum => 40 }
  validates :description, :length => { :maximum => 200 }
  has_paper_trail
  acts_as_paranoid
end
