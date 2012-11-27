class Transaction < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :detail_id, :detail_kind, :from_stock, :is_component, :kind, :to_stock

  validates :kind, :presence => true 
  validates :detail_kind, :presence => true 
  validates :detail_id, :presence => true 
  validates :from_stock, :presence => true 
  validates :to_stock, :presence => true 
end
