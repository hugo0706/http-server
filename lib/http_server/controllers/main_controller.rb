
module HttpServer
  module Controllers
    class MainController < BaseController
      def get
        body = nil
        HTTP::Response.new(body: body, http_code: 200, content_type: 'text/plain')
      end
    end
  end
end
