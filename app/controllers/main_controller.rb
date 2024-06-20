require_relative '../http_response'

class MainController
  class << self
    def handle(request)
      body = nil
      HttpResponse.new(body: body, http_code: 200, content_type: 'text/plain')
    end
  end
end
