FactoryGirl.define do
  factory :sensor_value do

    sensor_id 1
    capture_time { 1.day.ago }
    light 1
    air_temperature 2
    soil_moisture 3

    trait :with_invalid_capture_time do 
      capture_time { 1.day.from_now }
    end
  end
end