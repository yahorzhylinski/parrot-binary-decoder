class Api::SensorValues::SensorValuesIndexViewModel < ::Api::BaseViewModel

  POSSIBLE_PARAMS = [:sensor_id, :start_time, :end_time]

  IS_SENSOR_ID_REQUIRED = true
  IS_SENSOR_ID_INTEGER = true
  MIN_SENSOR_ID_VALUE = 0

  IS_START_TIME_NILABLE = true
  IS_END_TIME_NILABLE = true

  END_TIME_ERROR_IF_START_TIME_NOT_GREATER = "should be after start_time"

  attr_accessor *POSSIBLE_PARAMS

  validates :sensor_id, presence: IS_SENSOR_ID_REQUIRED
  validates_numericality_of :sensor_id, 
                            only_integer: IS_SENSOR_ID_INTEGER, 
                            greater_than: MIN_SENSOR_ID_VALUE

  validates :start_time, date: { allow_blank: IS_START_TIME_NILABLE }

  validates :end_time, date: { allow_blank: IS_END_TIME_NILABLE }

  validate :validate_end_time_if_start_exists!

  protected

    def validate_end_time_if_start_exists!
      if start_time.is_a?(DateTime) && end_time.is_a?(DateTime) && start_time > end_time
        errors.add :end_time, END_TIME_ERROR_IF_START_TIME_NOT_GREATER
      end
    end

end