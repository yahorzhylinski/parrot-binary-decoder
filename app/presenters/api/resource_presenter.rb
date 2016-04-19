class Api::ResourcePresenter

  def initialize(resource)
    @resource = resource
  end

  def as_json()
    @resource
  end

end