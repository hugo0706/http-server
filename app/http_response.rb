class HttpResponse
  CRLF = "\r\n"
  HTTP_VERSION = 'HTTP/1.1'
  STATUSES = {
    '200' => 'OK',
    '404' => 'Not Found'
  }

  attr_reader :body, :http_status, :http_version, :http_code

  def initialize(body:, http_code:)
    @body = body
    @http_code = http_code.to_s
    @http_version = HTTP_VERSION
  end

  def to_s
    "#{@http_version} #{@http_code} #{STATUSES.dig(@http_code)}#{CRLF}#{content_type}#{content_length}#{CRLF}#{@body}"
  end

  private

  def content_length
    "Content-Length: #{body.bytesize}#{CRLF}" if body
  end

  def content_type
    "Content-Type: text/plain#{CRLF}"
  end
end
