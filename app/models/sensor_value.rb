class SensorValue < ActiveRecord::Base

  # => 
  # => CONSTANTS
  # => 

  MIN_SENSOR_ID_VALUE = 0
  SENSOR_ID_SHOULD_PRESENCE = true
  SENSOR_ID_SHOULD_BE_ONLY_INTEGER = true

  CAPTURE_TIME_SHOULD_PRESENCE = true
  CAPTURE_TIME_MAX_DATE_TIME = DateTime.now

  AIR_TEMPERATURE_SHOULD_PRESENCE = true
  AIR_TEMPERATURE_SHOULD_BE_ONLY_INTEGER = true

  LIGHT_SHOULD_PRESENCE = true
  LIGHT_SHOULD_BE_ONLY_INTEGER = true

  SOIL_MOISTURE_SHOULD_PRESENCE = true
  SOIL_MOISTURE_SHOULD_BE_ONLY_INTEGER = true

  DUPLICATE_ERROR_TO_LOG = "Trying to insert duplicate for %s"

  # => 
  # => VALIDATIONS
  # => 

  # => it should presence, be only integer and greater than 0
  validates :sensor_id, presence: SENSOR_ID_SHOULD_PRESENCE
  validates_numericality_of :sensor_id, 
                            only_integer: SENSOR_ID_SHOULD_BE_ONLY_INTEGER, 
                            greater_than: MIN_SENSOR_ID_VALUE

  # => it should presence, and not be in the future
  validates :capture_time, presence: CAPTURE_TIME_SHOULD_PRESENCE
  validates :capture_time, date: 
                                { 
                                  before: Proc.new { CAPTURE_TIME_MAX_DATE_TIME } 
                                }

  # => should be unique
  validates_uniqueness_of :sensor_id, scope: :capture_time

  # => it should presence, be only integer
  validates :air_temperature, presence: AIR_TEMPERATURE_SHOULD_PRESENCE
  validates_numericality_of :air_temperature, only_integer: AIR_TEMPERATURE_SHOULD_BE_ONLY_INTEGER

  # => it should presence, be only integer
  validates :light, presence: LIGHT_SHOULD_PRESENCE
  validates_numericality_of :light, only_integer: LIGHT_SHOULD_BE_ONLY_INTEGER

  # => it should presence, be only integer
  validates :soil_moisture, presence: SOIL_MOISTURE_SHOULD_PRESENCE
  validates_numericality_of :soil_moisture, only_integer: SOIL_MOISTURE_SHOULD_BE_ONLY_INTEGER

  after_validation :do_something_if_validation_fails, unless: lambda { errors.empty? }

  protected
  def do_something_if_validation_fails
    if SensorValue.where(sensor_id: sensor_id, capture_time: capture_time).count > 0
      logger.info DUPLICATE_ERROR_TO_LOG % [self.inspect]
    end
  end

end
