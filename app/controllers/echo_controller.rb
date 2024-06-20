require_relative '../http_response'

class EchoController
  class << self
    def handle(request)
      body = request.target.split('/').last
      HttpResponse.new(body: body, http_code: 200)
    end
  end
end
