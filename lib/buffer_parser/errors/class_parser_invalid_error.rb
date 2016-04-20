class BufferParser::Errors::ClassParserInvalidError < BufferParser::Errors::BaseError

  DEFAULT_ERROR = "class_name should not be nil"

  def initialize
    super DEFAULT_ERROR
  end
end