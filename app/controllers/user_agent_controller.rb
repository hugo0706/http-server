class UserAgentController
  class << self
    def handle(request)
      body = request.headers['User-Agent']
      HttpResponse.new(body: body, http_code: 200, content_type: 'text/plain')
    end
  end
end
