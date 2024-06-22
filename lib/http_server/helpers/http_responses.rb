require_relative '../http/response.rb'

module HttpServer
  module BaseResponses
    def method_not_allowed
      HTTP::Response.new(body: nil, http_code: 405, content_type: nil)
    end

    def not_found
      HTTP::Response.new(body: nil, http_code: 404, content_type: nil)
    end

    def created
      HTTP::Response.new(body: nil, http_code: 201, content_type: nil)
    end

    def conflict
      HTTP::Response.new(body: nil, http_code: 409, content_type: nil)
    end
  end
end
