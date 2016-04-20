class BufferParser::Models::UploadSensorsModel < ::BinData::Record

  uint8 :file_version
  uint16be :nb_entres

  array :records, initial_length: :nb_entres do
    uint16be :sensor_id
    uint32be :capture_time
    uint16be :air_temperature
    uint16be :light
    uint16be :soil_moisture
  end

  def parsed_data(class_name)
    records.each do | record |
      params = {
        sensor_id: record.sensor_id,
        capture_time: record.capture_time ? Time.at(record.capture_time) : nil,
        air_temperature: record.air_temperature,
        light: record.light,
        soil_moisture: record.soil_moisture
      }

      class_name.new(params).save
    end
  end

end
