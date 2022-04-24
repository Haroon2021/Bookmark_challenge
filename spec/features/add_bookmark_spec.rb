#Visit web page,
#Fill in url into form
#Click submit
#View Page with content we added

feature 'Adding bookmark' do
    scenario 'a user can add bookmarks' do
      visit('/bookmarks/new')
      fill_in('url', with: 'http://www.makersacademy.com')
      fill_in('title', with: 'Makers')
      click_button('Submit')
      expect(page).to have_link("Makers", href: "http://www.makersacademy.com")    #The word Makers with the makers url link
    end
  end

