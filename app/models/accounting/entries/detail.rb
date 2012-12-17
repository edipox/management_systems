class Accounting::Entries::Detail < ActiveRecord::Base
  has_paper_trail
  attr_accessible :account_id, :account, :header_id, :value

  belongs_to :entry, :foreign_key => :id_asiento, :class_name => "Accounting::Entry"
  belongs_to :account, :foreign_key => :cuenta_id, :class_name => "Accounting::Account"

  validates :cuenta_id, :presence => true #, :length => { :minimum => 2 }  
  validates :importe, :presence => true #, :length => { :minimum => 2 }    
  validates :id_asiento, :presence => true #, :length => { :minimum => 2 }  
  
  set_table_name "asientos_detalles"
  alias_attribute :value, :importe
  alias_attribute :account_id, :cuenta_id
  alias_attribute :header_id, :id_asiento
  
end
