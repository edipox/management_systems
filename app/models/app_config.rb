class AppConfig < ActiveRecord::Base
  attr_accessible :value

  has_paper_trail
  acts_as_paranoid


  def self.get(id)
    AppConfig.find(id).value
  end
  
  alias_attribute :value, :valor
end
