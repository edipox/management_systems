class AppConfig < ActiveRecord::Base
  attr_accessible :value

  has_paper_trail

  def self.get(id)
    AppConfig.find(id).value
  end
end
