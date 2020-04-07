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
      params = context.request.query_params
      return context.response.respond_with_status 404 unless params.has_key? "id"
      user = Repo.find(params["id"].to_i64)
      context.response.respond_with_status 200, user.to_json
    end

    def self.update(context)
    end

    def self.index(context)
    end
  end
end