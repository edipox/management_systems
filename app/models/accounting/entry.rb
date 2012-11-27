class Accounting::Entry < ActiveRecord::Base
   has_paper_trail
  attr_accessible :date, :description, :number

  has_many :details, :foreign_key => :header_id, :class_name => "Accounting::Entrys::Detail"

  belongs_to :status, :class_name => "Transactions::Status"

  validates :number, :presence => true #, :length => { :minimum => 2 }  
  validates :date, :presence => true #, :length => { :minimum => 2 }  
end
