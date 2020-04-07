require "http/server/handler"

module Routes
  class NotFoundHandler
    include HTTP::Handler

    def call(context)
      context.response.respond_with_status 404, "Not found"
    end
  end
end
