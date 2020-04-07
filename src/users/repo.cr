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

    def self.find(id : Int64)
      run do |db|
        db.query_one "select rowid, * from users where rowid = #{id}" do |rs|
          User.new rs.read(Int64), rs.read(String), rs.read(Int32)
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
