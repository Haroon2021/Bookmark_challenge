require 'pg'

feature 'Viewing bookmarks' do
  scenario 'a user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    Bookmark.create('http://www.makersacademy.com','Makers')
    Bookmark.create('http://www.destroyallsoftware.com','destroyallsoftware')
    Bookmark.create('http://www.google.com','google')


    visit('/bookmarks')

    expect(page).to have_content "Makers"
    expect(page).to have_content "destroyallsoftware"
    expect(page).to have_content "google"
    
  end
end
