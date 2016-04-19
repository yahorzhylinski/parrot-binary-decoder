class Api::SensorValues::Index < ::Api::ResourcePresenter

  def initialize(values)
    super(values.map do | value | 
      {
        sensor_id: value.id,
        capture_time: value.capture_time,
        air_temperature: value.air_temperature,
        light: value.light,
        soil_moisture: value.soil_moisture
      }
    end)
  end

end