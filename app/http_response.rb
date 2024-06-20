class HttpResponse
  CRLF = "\r\n"
  HTTP_VERSION = 'HTTP/1.1'
  STATUSES = {
    '200' => 'OK',
    '201' => 'Created',
    '404' => 'Not Found',
    '405' => 'Method Not Allowed',
    '409' => 'Conflict'
  }

  attr_reader :body, :http_status, :http_version, :http_code, :content_type

  def initialize(body:, http_code:, content_type:)
    @body = body
    @http_code = http_code.to_s
    @http_version = HTTP_VERSION
    @content_type = content_type
  end

  def to_s
    "#{@http_version} #{@http_code} #{STATUSES.dig(@http_code)}#{CRLF}#{content_type}#{content_length}#{CRLF}#{@body}"
  end

  private

  def content_length
    "Content-Length: #{body.bytesize}#{CRLF}" if body
  end

  def content_type
    "Content-Type: #{@content_type}#{CRLF}" if @content_type
  end
end
