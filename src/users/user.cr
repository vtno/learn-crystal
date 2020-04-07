require "db"
require "json"

module Users
  class User
    DB.mapping(
      name: String,
      age: Int32
    )

    JSON.mapping(
      name: String,
      age: Int32
    )
    
    def initialize(@name : String, @age : Int32)
    end
  end
end
