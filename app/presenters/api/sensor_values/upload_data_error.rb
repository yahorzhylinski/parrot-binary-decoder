class Api::SensorValues::UploadDataError < ::Api::ResourcePresenter

  def initialize(error)
    super([error])
  end

end