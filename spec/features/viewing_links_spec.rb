feature 'Viewing saved links' do

  scenario 'See a list of links on the homepage' do
    visit('/')
    expect(page).to have_content('It works')
  end
end
