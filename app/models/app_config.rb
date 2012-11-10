class AppConfig < ActiveRecord::Base
  attr_accessible :value

  has_paper_trail
end
