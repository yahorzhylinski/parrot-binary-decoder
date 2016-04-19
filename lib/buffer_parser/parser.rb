class BufferParser::Parser

  INVALID_BASE64_ERROR = "buffer is invalid base64"
  DEFAULT_ERROR = "some problems with reading your buffer"


  def initialize(base64data, class_parser)
    @base64data = base64data
    @class_parser = class_parser
    @result_array = []
  end

  def get_data
    
    return @result_array if @result_array.length > 0

    if !@class_parser
      raise Errors::ClassParserInvalidError.new
    end

    if !@base64data
      raise ::BufferParser::Errors::BufferIsRequiredError.new
    end

    binary_data = ""
    begin
      binary_data = Base64.decode64(@base64data)
    rescue ArgumentError => e
      raise ::BufferParser::Errors::BaseError.new INVALID_BASE64_ERROR
    end

    begin
      @result_array = @class_parser.read(binary_data)
    rescue Exception => e
      raise ::BufferParser::Errors::BaseError.new DEFAULT_ERROR
    end

    @result_array
  end

end