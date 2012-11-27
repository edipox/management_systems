class Components::Item < ActiveRecord::Base
  acts_as_paranoid
    attr_accessible :brand, :brand_id, :category, :category_id, :code, :price, :description, :name, :minimum_quantity
  belongs_to :category, :class_name => Components::Category.to_s
  belongs_to :brand, :class_name => Components::Brand.to_s
  validates_presence_of  :code, :name, :category_id, :brand_id, :minimum_quantity, :price
  validates :code, :uniqueness => true
  has_many :raw_material_stocks, :foreign_key => :component_id, :class_name => ::Stocks::Component.to_s
  has_many :production_stocks, :foreign_key => :component_id, :class_name => ::Stocks::Production.to_s
  has_many :products_stocks, :foreign_key => :component_id, :class_name => ::Stocks::Product.to_s
  has_paper_trail
  
  has_many :requests_transferences_components_details, :foreign_key => :component_id, :class_name => Requests::Transferences::Components::Detail.to_s
  
  has_many :requests_devolutions_components_details, :foreign_key => :component_id, :class_name => Requests::Devolutions::Components::Detail.to_s
  
  has_many :products_compositions_details, :foreign_key => :component_id, :class_name => Products::Compositions::Detail.to_s
  
  has_many :requests_purchases_components_details, :foreign_key => :component_id, :class_name => Requests::Purchases::Components::Detail.to_s  
    
  def raw_material_total_stock
    qty = raw_material_stocks.reduce do |s0, s1|
      s0.quantity += s1.quantity
      s0
    end

    qty.nil? ? 0 : qty.quantity
  end

  def production_total_stock
    qty = production_stocks.reduce do |s0, s1|
      s0.quantity += s1.quantity
      s0
    end

    qty.nil? ? 0 : qty.quantity
  end
end
