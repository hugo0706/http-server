
module HttpServer
  module Controllers
    class UserAgentController < BaseController
      def get
        body = request.headers['User-Agent']
        HTTP::Response.new(body: body, http_code: 200, content_type: 'text/plain')
      end
    end
  end
end
