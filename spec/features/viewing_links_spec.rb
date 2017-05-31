require 'spec_helper'

feature 'Viewing saved links' do

  scenario 'I can see a list of links' do

    Link.create(url: 'http://www.url.com', title: 'url')
    visit('/links')

    # sanity check
    expect(page.status_code).to eq 200
    expect(page).to have_content('http://www.url.com')
  end
end
