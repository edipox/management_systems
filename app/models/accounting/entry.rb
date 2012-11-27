class Accounting::Entry < ActiveRecord::Base
  has_paper_trail
  attr_accessible :description, :number

  has_many :details, :foreign_key => :header_id, :class_name => "Accounting::Entries::Detail"

  auto_increment :column => :number  
end
