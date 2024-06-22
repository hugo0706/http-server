Dir[File.join(__dir__, 'controllers', '*.rb')].each { |file| require_relative file }

module HttpServer
  class Routes
    ROUTES = {
      '/' => Controllers::MainController,
      '/echo' => Controllers::EchoController,
      '/user-agent' => Controllers::UserAgentController,
      '/files' => Controllers::FilesController
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
end
