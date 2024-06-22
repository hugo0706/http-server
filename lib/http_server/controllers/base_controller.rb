require_relative '../helpers/http_responses.rb'

module HttpServer
  module Controllers
    class BaseController
      include HttpServer::BaseResponses
      
      attr_reader :request

      def initialize(request)
        @request = request
      end

      def handle
        if self.respond_to?(http_method)
          send(http_method)
        else
          method_not_allowed
        end
      end

      private

      def http_method
        request.http_method.downcase
      end

      def request
        @request
      end
    end
  end
end
