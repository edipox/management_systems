class Orders::Productions::Detail < ActiveRecord::Base
   has_paper_trail
  acts_as_paranoid

  attr_accessible :header_id, :product_id, :quantity, :product
#  validates :product_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :header_id, :presence => true #, :length => { :minimum => 2 }  
#  validates :quantity, :presence => true #, :length => { :minimum => 2 }  

  belongs_to :product, :foreign_key => :producto_terminado_id, :class_name => Products::Composition.to_s  
  
  belongs_to :orders_production, :foreign_key => :orden_produccion_id, :class_name => Orders::Production.to_s
  
  has_many :requests, :foreign_key => :orden_produccion_detalle_id, :class_name => Requests::Transferences::Component.to_s  
  
    
  before_destroy :destroy_requests_details
  def destroy_requests_details
    open_status_id = AppConfig.find('open_status_id').value
    requests.each do |r|
      if r.status_id == open_status_id
        r.destroy
      end
    end  
  end
  
  after_create :increment_quantity
  def increment_quantity
    orders_production.details.each  do |d|
      if d.product_id == product_id && d.id != id
        d.quantity += quantity
        d.save
        self.destroy
      end
    end
  end
  
  after_create :generate_request
  def generate_request
    orders_production.generate_request
  end
  
  after_update :update_request
  def update_request
    orders_production.update_request
  end

  set_table_name "ordenes_producciones_detalles"
  alias_attribute :quantity, :cantidad
  alias_attribute :product_id, :producto_terminado_id
  alias_attribute :header_id, :orden_produccion_id
  
  validates :producto_terminado_id, :presence => true #, :length => { :minimum => 2 }  
  validates :orden_produccion_id, :presence => true #, :length => { :minimum => 2 }  
  validates :cantidad, :presence => true #, :length => { :minimum => 2 }  
  
  # New relation
  has_many :requests, :foreign_key => :orden_produccion_detalle_id, :class_name => Requests::Transferences::Products::Detail.to_s

end
