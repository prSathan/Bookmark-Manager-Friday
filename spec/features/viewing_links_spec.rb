# require 'spec_helper'

feature 'Viewing saved links' do

  scenario 'I can see a list of links' do

    Link.create(url: 'http://www.google.co.uk', title: 'google')
    visit('/links')

    # sanity check
    expect(page.status_code).to eq 200
    expect(page).to have_content('http://www.google.co.uk')
  end
end
