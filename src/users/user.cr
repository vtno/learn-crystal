require "db"
require "json"

module Users
  class User
    DB.mapping(
      name: String,
      age: Int32
    )

    JSON.mapping(
      id: Int64,
      name: String,
      age: Int32
    )

    @id : (Int64)?
    
    def initialize(@name : String, @age : Int32)
      @id = nil
    end

    def initialize(@id : Int64, @name : String, @age : Int32); end
  end
end
