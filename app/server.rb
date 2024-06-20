require "socket"
require_relative "request_handler"

server = TCPServer.new("localhost", 4221)

loop do
  client_socket, client_address = server.accept
  RequestHandler.new(client_socket).call
end

server.close
