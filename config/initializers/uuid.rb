class ActiveRecord::Base
  def self.inherited(subclass)
    subclass.class_eval do
      self.primary_key = :id
      attr_accessible :id
      attr_readonly :id
      before_create :generate_uuid
    end
  end

  private
  def generate_uuid
    self.id = UUID.new.generate
  end
end
