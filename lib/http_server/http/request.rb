
module HttpServer
  module HTTP
    class Request

      attr_accessor :headers, :body, :http_method , :target , :http_version

      def initialize(request_line:, headers:, body:)
        parse_request_line(request_line)
        parse_headers(headers)
        parse_body(body)
      end

      private

      def parse_request_line(request_line)
        @http_method, @target, @http_version = request_line.split(' ')
      end

      def parse_headers(headers)
        @headers = {}
        headers.each do |header|
          key, value = header.split(': ')
          @headers[key] = value
        end
      end

      def parse_body(body)
        @body = body
      end
    end
  end
end
