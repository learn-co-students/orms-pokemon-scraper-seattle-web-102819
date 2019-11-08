class Pokemon

    attr_accessor :id, :name, :type, :db
 

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = <<-SQL
          INSERT INTO pokemon (name, type)
          VALUES (?, ?)
        SQL
        db.execute(sql, name, type)
    end
    
    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
        arr = db.execute(sql, id)[0]
        self.new(id: arr[0], name: arr[1], type: arr[2], db: db)
    end

end
