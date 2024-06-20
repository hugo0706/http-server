require_relative 'routes'

class ResponseHandler
  class << self
    def call(request, socket)
      handler = Routes.handler_for(request.target)
      if handler
        response = handler.handle(request)
      else
        socket.puts "HTTP/1.1 404 Not Found\r\n\r\n"
      end

      send_response(response, socket)
    end

    private

    def send_response(response, socket)
      socket.puts(response.to_s)
    end
  end
end
