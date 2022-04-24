require 'pg'

class Bookmark

    attr_reader :url, :title, :id

def initialize(url:, title:, id:)
  @url = url
  @title = title
  @id = id
end

    def self.all
        connect_to_db
        result = @conn.exec( "SELECT * FROM bookmarks" )     #Write SQL commands this one pulls all table data
        result.map { |bookmark| Bookmark.new(url: bookmark['url'], title: bookmark['title'], id: bookmark['id'])}

    end

    def self.create(url,title)
        connect_to_db
        result = @conn.exec("INSERT INTO bookmarks (url,title) VALUES('#{url}','#{title}') RETURNING id, title, url")
        Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
    end

    private 
    def self.connect_to_db

    if ENV['ENVIRONMENT'] == 'test'
        @conn = PG.connect( dbname: 'bookmark_manager_test' )     #Connects to the db you want 
    else
        @conn = PG.connect( dbname: 'bookmark_manager' )
    end
    end
    
end