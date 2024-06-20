
class UserAgentController < BaseController
  def get
    body = request.headers['User-Agent']
    HttpResponse.new(body: body, http_code: 200, content_type: 'text/plain')
  end
end
