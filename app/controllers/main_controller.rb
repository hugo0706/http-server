require_relative '../http_response'

class MainController
  class << self
    def handle(request)
      body = nil
      HttpResponse.new(body: body, http_code: 200)
    end
  end
end
