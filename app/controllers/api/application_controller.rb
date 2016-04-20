class Api::ApplicationController < ::ApplicationController

  protected

    def success_response data=nil, status=:ok
      build_response data, status, true
    end

    def error_response data, status
      build_response data, status, false
    end

    def build_response data, status, is_success
      render json: { "#{is_success ? "data" : "errors"}": data }, status: status and return
    end

end