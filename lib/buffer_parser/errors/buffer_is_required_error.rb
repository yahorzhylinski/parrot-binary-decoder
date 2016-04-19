class BufferParser::Errors::BufferIsRequiredError < BufferParser::Errors::BaseError

  DEFAULT_ERROR = "buffer should not be nil"

  def initialize
    super DEFAULT_ERROR
  end
end