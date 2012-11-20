class Requests::Devolutions::Component < ActiveRecord::Base
   has_paper_trail
   attr_accessible :number, :reason, :status_id, :transaction_id, :user_id, :user, :transaction, :header_id, :component_id, :component, :status

  has_many :details, :foreign_key => :header_id, :class_name => "Requests::Devolutions::Components::Detail"

  belongs_to :status, :class_name => "Transactions::Status"
  belongs_to :user

  validates :transaction_id, :presence => true #, :length => { :minimum => 2 }  
  validates :status_id, :presence => true #, :length => { :minimum => 2 }  
  validates :user_id, :presence => true #, :length => { :minimum => 2 }  
  validates :reason, :presence => true #, :length => { :minimum => 2 }  
  
  belongs_to :transaction, :foreign_key => :transaction_id, :class_name => "Stocks::Transactions::Component"


#  before_create :set_number
#  def set_number
#    max_number = Requests::Devolutions::Component.maximum(:number)
#    self.number = max_number.to_i + 1
#  end
  auto_increment :column => :number
end
