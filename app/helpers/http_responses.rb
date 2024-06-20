require_relative '../http_response.rb'

def method_not_allowed
  HttpResponse.new(body: nil, http_code: 405, content_type: nil)
end

def not_found
  HttpResponse.new(body: nil, http_code: 404, content_type: nil)
end

def created
  HttpResponse.new(body: nil, http_code: 201, content_type: nil)
end

def conflict
  HttpResponse.new(body: nil, http_code: 409, content_type: nil)
end
