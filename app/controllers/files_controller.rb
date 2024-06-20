
class FilesController < BaseController
  def get
    filename = request.target.split('/').last
    begin
      directory = ARGV[1]
      file = File.open("#{directory}#{filename}", "r")
      body = file.read
      
      HttpResponse.new(body: body, http_code: 200 , content_type: 'application/octet-stream' )
    rescue Errno::ENOENT
      not_found
    end
  end

  def post
    filename = request.target.split('/').last
    directory = ARGV[1]

    File.open("#{directory}#{filename}", "w") do |file|
      file.write request.body
    end

    created
  end
end
