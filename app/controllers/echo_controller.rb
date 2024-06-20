
class EchoController < BaseController
    def get
      body = request.target.split('/').last
      HttpResponse.new(body: body, http_code: 200, content_type: 'text/plain')
    end
end
