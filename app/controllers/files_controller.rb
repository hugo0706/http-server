require_relative '../http_response'

class FilesController
  class << self
    def handle(request)
      filename = request.target.split('/').last
      begin
        directory = ARGV[1]
        file = File.open("#{directory}#{filename}", "r")
        body = file.read
        HttpResponse.new(body: body, http_code: 200 , content_type: 'application/octet-stream' )
      rescue Errno::ENOENT
        HttpResponse.new(body: nil, http_code: 404, content_type: nil)
      end
    end
  end
end
