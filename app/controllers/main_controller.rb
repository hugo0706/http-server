
class MainController < BaseController
  def get
    body = nil
    HttpResponse.new(body: body, http_code: 200, content_type: 'text/plain')
  end
end
