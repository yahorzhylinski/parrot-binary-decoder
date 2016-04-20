class Api::SensorValuesController < ::Api::ApplicationController

  def upload_data

    parser = ::BufferParser::Parser.new upload_data_params[:buffer], 
                                        ::BufferParser::Models::UploadSensorsModel

    begin
      @data = parser.get_data
    rescue BufferParser::Errors::BaseError => e
      return error_response Api::SensorValues::UploadDataError.new(e.message).as_json, :bad_request
    end

    @data.parsed_data(SensorValue)

    success_response
  end

  def index

    params = Api::SensorValues::SensorValuesIndexViewModel.new index_search_params
    if !params.valid?
      return error_response Api::SensorValues::IndexErrors.new(params.errors.full_messages).as_json, 
                         :bad_request
    end

    result = SensorValue.where(sensor_id: params.sensor_id)
    result = result.where("capture_time >= ?", params.start_time) if params.start_time
    result = result.where("capture_time <= ?", params.end_time) if params.end_time

    success_response Api::SensorValues::Index.new(result.all).as_json
  end

  protected

    def upload_data_params
      params.permit :buffer
    end

    def index_search_params
      params.permit *Api::SensorValues::SensorValuesIndexViewModel::POSSIBLE_PARAMS
    end

end