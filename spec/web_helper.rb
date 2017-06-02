def sign_up(email: 'student@makersacademy.com',
            password: 'learn',
            password_confirmation: 'learn')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Signup'
end
