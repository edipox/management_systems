class Accounting::Year < ActiveRecord::Base
  has_paper_trail
  attr_accessible :start_date, :end_date
  has_many :entries, :foreign_key => :ejercicio_id, :class_name => Accounting::Entry.to_s

  set_table_name "ejercicios_contables"
  alias_attribute :start_date, :fecha_inicio
  alias_attribute :end_date, :fecha_fin
end
