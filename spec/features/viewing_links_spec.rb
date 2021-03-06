feature 'Viewing saved links' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
  end

  scenario 'I can see a list of links' do
    Link.create(url: 'http://www.google.co.uk', title: 'Google')
    visit('/links')
    expect(page.status_code).to eq 200
    expect(page).to have_content('http://www.google.co.uk')
  end

  scenario 'I can filter links by tag' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).not_to have_content('Makers Academy')
      expect(page).not_to have_content('Code.org')
      expect(page).to have_content('This is Zombocom')
      expect(page).to have_content('Bubble Bobble')
    end
  end

  scenario 'I can add and view multiple tags' do
    visit('/links/new')
    fill_in('title', with: 'Google')
    fill_in('url', with: 'http://www.google.co.uk')
    fill_in('tags', with: 'search mail maps news weather')
    click_button('Submit')
    link = Link.last
    expect(link.tags.map(&:name)).to include('search', 'mail', 'maps', 'news', 'weather')
  end

end
