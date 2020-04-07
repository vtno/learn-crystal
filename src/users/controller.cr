require "./user"
require "./repo"
require "json"

module Users
  module Controller
    def self.create_table(context)
      Repo.create_table
    end
  
    def self.post(context)
      if context.request.body.nil?
        return context.response.respond_with_status 422
      end

      user = User.from_json context.request.body.not_nil!

      Repo.save user

      context.response.respond_with_status 201, "created"
    end

    def self.show(context)
    end

    def self.update(context)
    end

    def self.index(context)
    end
  end
end