require "rails_helper"

RSpec.describe Api::SensorValues::SensorValuesIndexViewModel, type: :model do

  it { should validate_presence_of(:sensor_id) }
  it { should validate_numericality_of(:sensor_id).only_integer }
  it { should validate_numericality_of(:sensor_id).is_greater_than(0) }

  it 'should be valid without dates' do
    sensor_value = FactoryGirl.build :api_sensor_values_index_view_model
    expect(sensor_value.valid?).to eq(true)
  end

  it 'should validate start_time' do
    sensor_value = FactoryGirl.build :api_sensor_values_index_view_model
    sensor_value.start_time = 123
    sensor_value.valid?
    expect(sensor_value.valid?).to be_falsey
    expect(sensor_value.errors[:start_time].size).to eq(1)
  end

  it 'should validate end_time' do
    sensor_value = FactoryGirl.build :api_sensor_values_index_view_model
    sensor_value.end_time = 123
    sensor_value.valid?
    expect(sensor_value.valid?).to be_falsey
    expect(sensor_value.errors[:end_time].size).to eq(1)
  end

  it 'should validate that start_time is greater than end_time' do
    sensor_value = FactoryGirl.build :api_sensor_values_index_view_model
    sensor_value.start_time = DateTime.now - 1.day
    sensor_value.end_time = DateTime.now - 2.day
    sensor_value.valid?
    expect(sensor_value.valid?).to be_falsey
    expect(sensor_value.errors[:end_time].size).to eq(1)
  end

  it 'should be valid if start_time is greater than end_time' do
    sensor_value = FactoryGirl.build :api_sensor_values_index_view_model
    sensor_value.start_time = DateTime.now - 3.day
    sensor_value.end_time = DateTime.now - 2.day
    sensor_value.valid?
    expect(sensor_value.valid?).to eq(true)
  end

  it 'should ignore comparison validation if start_time is nil' do
    sensor_value = FactoryGirl.build :api_sensor_values_index_view_model
    sensor_value.end_time = DateTime.now
    sensor_value.valid?
    expect(sensor_value.valid?).to eq(true)
  end

  it 'should ignore comparison validation if end_time is nil' do
    sensor_value = FactoryGirl.build :api_sensor_values_index_view_model
    sensor_value.start_time = DateTime.now
    expect(sensor_value.valid?).to eq(true)
  end

end