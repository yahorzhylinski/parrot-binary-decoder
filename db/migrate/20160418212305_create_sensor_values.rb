class CreateSensorValues < ActiveRecord::Migration
  def change

    # => it seems that all fields should be not nil
    create_table :sensor_values do |t|
      t.integer :sensor_id, nil: false
      t.datetime :capture_time, nil: false
      t.integer :air_temperature, nil: false
      t.integer :light, nil: false
      t.integer :soil_moisture, nil: false
      t.timestamps null: false
    end

    # => to be sure that the sensor at the current time has unique values
    add_index :sensor_values, [:sensor_id, :capture_time], unique: true
  end
end
