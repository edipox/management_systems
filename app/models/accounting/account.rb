class Accounting::Account < ActiveRecord::Base
  has_paper_trail
  attr_accessible :entrable, :name, :kind, :parent_id, :number

  has_many :details, :foreign_key => :account, :class_name => "Accounting::Entries::Detail"

  validates :nombre, :presence => true #, :length => { :minimum => 2 }  
  validates :asentable, :presence => true #, :length => { :minimum => 2 }  

  set_table_name "cuentas_contables"
  alias_attribute :entrable, :asentable
  alias_attribute :name, :nombre
  alias_attribute :kind, :tipo
  alias_attribute :parent_id, :cuenta_superior_id
  alias_attribute :number, :numero
  
  def d_kind?
    kind == "d"
  end
  
  def h_kind?
    kind == "h"
  end
  
end
