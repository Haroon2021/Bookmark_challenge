require 'bookmark'
require 'pg'

describe Bookmark do
  describe '.all' do
    it 'returns all of the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')


      Bookmark.create('http://www.makersacademy.com', 'Makers')
      Bookmark.create('http://www.destroyallsoftware.com','destroyallsoftware')
      Bookmark.create('http://www.google.com','google')

      bookmarks = Bookmark.all
      p'***** Look here *****'
      p bookmarks
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#Bookmark.create' do
    it 'create a new bookmark' do
      
      bookmark = Bookmark.create(url='url1',title = 'title')
      expect(bookmark).to be_a Bookmark
      expect(bookmark.title).to eq 'title'
      expect(bookmark.url).to eq 'url1'

    end
  end
end