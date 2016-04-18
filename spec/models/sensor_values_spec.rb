require "rails_helper"

RSpec.describe SensorValue, type: :model do

  it { should validate_presence_of(:sensor_id) }
  it { should validate_numericality_of(:sensor_id).only_integer }
  it { should validate_numericality_of(:sensor_id).is_greater_than(0) }

  it { should validate_presence_of(:capture_time) }
  it { should validate_uniqueness_of(:sensor_id).scoped_to(:capture_time) }

  it { should validate_presence_of(:air_temperature) }
  it { should validate_numericality_of(:air_temperature).only_integer }

  it { should validate_presence_of(:light) }
  it { should validate_numericality_of(:light).only_integer }

  it { should validate_presence_of(:soil_moisture) }
  it { should validate_numericality_of(:soil_moisture).only_integer }

  it 'should validate capture_time' do
    sensor_value = FactoryGirl.build :sensor_value, :with_invalid_capture_time
    sensor_value.valid?
    expect(sensor_value.valid?).to be_falsey
    expect(sensor_value.errors[:capture_time].size).to eq(1)
  end

  it 'should validate capture_time uniqueness of capture_time and sensor_id' do
    sensor_value_1 = FactoryGirl.build :sensor_value
    sensor_value_1.save
    sensor_value_2 = FactoryGirl.build :sensor_value
    expect(sensor_value_2.valid?).to be_falsey
    expect(sensor_value_2.errors[:sensor_id].size).to eq(1)
  end

end