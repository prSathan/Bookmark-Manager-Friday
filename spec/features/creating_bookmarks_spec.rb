feature 'Creating new bookmarks' do

  scenario 'able to add new links to the bookmark manager' do
    visit('/links')
    click_button('New bookmark')
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk')
    # fill_in('tags', with: 'news')
    click_button('Submit')
    expect(current_path).to eq '/links'
    expect(page).to have_content('http://www.bbc.co.uk')
  end

  scenario 'able to tags to bookmarks' do
    visit('/links')
    click_button('New bookmark')
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk')
    fill_in('tags', with: 'news')
    click_button('Submit')
    expect(current_path).to eq '/links'
    expect(page).to have_content('news')

  end

end
