require_relative "http_request"
require_relative "response_handler"

class RequestHandler
  attr_reader :socket

  def initialize(socket)
    @socket = socket
  end

  def call
    request_line = socket.gets
    set_headers
    set_body

    parsed_request = HttpRequest.new(request_line: request_line, headers: @headers, body: @body)
    handle_response(parsed_request, socket)
  end

  private

  def set_body
    @body = nil

    if content_length
      body_lenght = content_length.split(': ').last.to_i
      @body = socket.read(lenght)
    end
  end

  def set_headers
    @headers = []
    while (line = socket.gets) && (line !="\r\n")
      @headers << line.chomp
    end
  end

  def handle_response(request, socket)
    ResponseHandler.call(request, socket)
  end

  def content_length
    @headers.find {|header| header.start_with?('Content-Lenght:')}
  end
end
