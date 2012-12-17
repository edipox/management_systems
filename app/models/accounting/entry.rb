class Accounting::Entry < ActiveRecord::Base
  has_paper_trail
  attr_accessible :description, :number, :accounting_year_id

  has_many :details, :foreign_key => :id_asiento, :class_name => Accounting::Entries::Detail.to_s
  belongs_to :year, :foreign_key => :ejercicio_id, :class_name => Accounting::Year.to_s

  auto_increment :column => :numero  

  set_table_name "asientos"
  alias_attribute :number, :numero
  alias_attribute :description, :descripcion
  alias_attribute :accounting_year_id, :ejercicio_id
  
  before_validation :set_defaut_accounting_year
  
  def set_defaut_accounting_year
    self.accounting_year_id = AppConfig.find("current_accounting_year_id").value unless self.accounting_year_id
  end 
  
  def d_kind_details
    d_kind_details = []
    details.each do |d|
      d_kind_details << d if d.account.d_kind?
    end
    return d_kind_details
  end
  
  def h_kind_details
    h_kind_details = []
    details.each do |d|
      h_kind_details << d if d.account.h_kind?
    end
    return h_kind_details
  end
  
end
