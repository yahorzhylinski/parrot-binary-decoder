class Api::BaseViewModel

  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  # => constructor to set all params
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  # => to display params keys correctly on bad response
  def self.human_attribute_name(attr_name, options={})
    attr_name || super
  end
end