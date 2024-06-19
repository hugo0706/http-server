require "socket"
require_relative "http_request"

server = TCPServer.new("localhost", 4221)
client_socket, client_address = server.accept

request_line = client_socket.gets
headers = []
body = nil

while (line = client_socket.gets) && (line !="\r\n")
  headers << line.chomp
end

content_length = headers.find {|header| header.start_with?('Content-Lenght:')}

if content_length
  body_lenght = content_length.split(': ').last.to_i
  body = client_socket.read(lenght)
end

parsed_request = HttpRequest.new(request_line: request_line, headers: headers, body: body)

if parsed_request.target == '/'
  client_socket.puts "HTTP/1.1 200 OK\r\n\r\n"
else
  client_socket.puts "HTTP/1.1 404 Not Found\r\n\r\n"
end

server.close
