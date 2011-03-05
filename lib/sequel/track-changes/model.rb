
require 'json'

class Changes < Sequel::Model
  plugin :serialization
  serialize_attributes :json, :old_values, :new_values

  def before_create
    self.created_at ||= Time.now
  end
end
