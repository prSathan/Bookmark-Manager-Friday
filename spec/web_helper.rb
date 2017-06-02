def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'student@makersacademy.com'
  fill_in :password, with: 'learn!'
  click_button 'Signup'
end