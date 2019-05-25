# config/database.rb

require 'dotenv/load'

class Database

    attr_accessor :conn, :host, :user, :pass, :name, :port

    # Database Constructor Method
    def initialize
        self.conn = ENV.fetch('DB_CONN', 'mysql')
        self.host = ENV.fetch('DB_HOST', '127.0.0.1')
        self.user = ENV.fetch('DB_USER', 'root')
        self.pass = ENV.fetch('DB_PASS', '')
        self.name = ENV.fetch('DB_NAME', 'stefanini')
        self.port = ENV.fetch('DB_PORT', '3306')
    end
    
    def connection(database)
        if database == 'mysql'
            @connection = MYSQL.connect()
        elsif database == 'pgsql'
            @connection = PG.connect(host: self.host, dbname: self.dbname, user: self.user, password: self.password)
        end
    end

    def retorna
        self.conn
    end
end