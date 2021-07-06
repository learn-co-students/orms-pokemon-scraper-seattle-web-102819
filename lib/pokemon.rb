class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name        
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon(name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        arr = db.execute(sql, id)[0]
        self.new(id: arr[0], name: arr[1], type: arr[2], db: db)
    end
end
