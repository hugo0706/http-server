require "socket"
require_relative "../lib/http_server/request_handler"

server = TCPServer.new("localhost", 4221)

loop do
  client_socket, client_address = server.accept
  Thread.new(client_socket) do |client|
    HttpServer::RequestHandler.new(client).call
  ensure
    client.close
  end
end

server.close
