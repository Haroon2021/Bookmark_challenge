require 'pg'
p 'Setting up database'

result = PG.connect( dbname: 'bookmark_manager_test' )
result.exec('TRUNCATE bookmarks;')

