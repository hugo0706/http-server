Dir[File.join(__dir__, 'controllers', '*.rb')].each { |file| require_relative file }

class Routes
  ROUTES = {
    '/' => MainController,
    '/echo' => EchoController,
    '/user-agent' => UserAgentController,
    '/files' => FilesController
  }

  class << self
    def handler_for(target)
      ROUTES.dig(base_path(target))
    end

    private

    def base_path(target)
      return target if target == '/'
      return target.match(%r{(/[^/]+)})[1]
    end
  end
end
