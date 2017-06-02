feature 'user signup' do
  scenario 'user creates an account and receives welcome message' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome student@makersacademy.com'
    expect(User.first.email).to eq('student@makersacademy.com')
  end
end