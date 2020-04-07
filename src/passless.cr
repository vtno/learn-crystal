# TODO: Write documentation for `Passless`
require "http/server"
require "./routes/not_found"
require "./routes/users"

module Passless
  include Routes

  VERSION = "0.1.0"

  def self.start
    global_handlers = [
      HTTP::LogHandler.new,
      Users.new,
      NotFoundHandler.new,
      HTTP::ErrorHandler.new,
    ]

    server = HTTP::Server.new(global_handlers)

    address = server.bind_tcp 8080
    puts "Listening on port http://#{address}"
    server.listen
  end
end

Passless.start
