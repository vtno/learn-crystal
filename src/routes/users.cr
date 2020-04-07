require "http/server/handler"
require "../users/controller"

module Routes
  class Users
    include HTTP::Handler
    include ::Users

    def call(context)
      case context.request.path
      when "/users"
        handle(context)
      when /\/user/
        handle_sigular(context)
      when "/user/table"
        Controller.create_table(context) if context.request.method == "POST"
      else
        call_next context
      end
    end

    private def handle(context)
      Controller.post context if context.request.method == "POST"
      Controller.index context if context.request.method == "GET"
    end

    private def handle_sigular(context)
      Controller.show context if context.request.method == "GET"
      Controller.update context if %w(PUT PATCH).includes? context.request.method  
    end
  end
end
