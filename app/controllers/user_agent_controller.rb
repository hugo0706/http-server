class UserAgentController
  class << self
    def handle(request)
      body = request.headers['User-Agent']
      HttpResponse.new(body: body, http_code: 200)
    end
  end
end
