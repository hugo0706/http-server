require_relative '../http_response'

class EchoController
  class << self
    def handle(request)
      body = request.target.split('/').last
      HttpResponse.new(body: body, http_code: 200, content_type: 'text/plain')
    end
  end
end
