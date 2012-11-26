class Requests::Purchases::Component < ActiveRecord::Base
   has_paper_trail
  attr_accessible :status_id, :status, :user_id, :user, :header, :header_id, :number

  has_many :details, :foreign_key => :header_id, :class_name => Requests::Purchases::Components::Detail.to_s

  belongs_to :status, :class_name => Transactions::Status.to_s
  belongs_to :user

  validates :status_id, :presence => true
  validates :user_id, :presence => true
  
  auto_increment :column => :number  
  
  def close
    details.each do |d|
      Stocks::Component.create!({ component_id: d.component.id, quantity: d.quantity, price: d.component.price })
    end
    return true
  end
  
end
