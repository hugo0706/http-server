require_relative 'routes'
require_relative './helpers/http_responses.rb'

class ResponseHandler
  class << self
    def call(request, socket)
      handler = Routes.handler_for(request.target)
      if handler
        response = handler.new(request).handle
      else
        response = not_found
      end

      send_response(response, socket)
    end

    private

    def send_response(response, socket)
      socket.puts(response.to_s)
    end
  end
end
