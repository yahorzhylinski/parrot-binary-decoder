class BufferParser::Errors::BaseError < ::StandardError

  def initialize msg
    super msg
  end

end