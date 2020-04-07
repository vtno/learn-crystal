require "db"
require "sqlite3"

module Users
  class Repo
    def self.create_table
      run do |db|
        db.exec "create table users (name text, age Int32)"
      end
    end

    def self.save(user : User)
      run do |db|
        db.exec "insert into users (name, age) values ('#{user.name}', #{user.age})"
      end
    end

    def self.find(id : Int32)
      run do |db|
        db.query "select name, age from users where id #{id}" do |rs|
          name, age = rs.read(String, Int32)
          User.new name, age
        end
      end
    end

    private def self.run
      DB.open("sqlite3:./temp.db") do |db|
        yield db
      end
    end
  end
end
