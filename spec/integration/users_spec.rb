require 'rails_helper'

RSpec.describe 'Users >', type: :feature do
  let(:user_a) do
    User.new(username: 'Pete', full_name: 'Pete Pants',
             photo: Rack::Test::UploadedFile.new('spec/support/photo_test.jpeg', 'image/jpeg'),
             cover_image: Rack::Test::UploadedFile.new('spec/support/cov.jpeg', 'image/jpeg'))
  end
  let(:user_b) do
    User.new(username: 'Pedro', full_name: 'Pedro Pants',
             photo: Rack::Test::UploadedFile.new('spec/support/photo_test.jpeg', 'image/jpeg'),
             cover_image: Rack::Test::UploadedFile.new('spec/support/cov.jpeg', 'image/jpeg'))
  end

  def sign_up(user)
    visit new_user_path
    fill_in 'Username', with: user.username
    fill_in 'Full name', with: user.full_name
    attach_file 'Photo', "#{Rails.root}/spec/support/photo_test.jpeg"
    attach_file 'Cover image', "#{Rails.root}/spec/support/cov.jpeg"
    click_on 'Create User'
  end

  def log_in(user)
    visit login_path
    fill_in 'Username', with: user.username
    click_on 'Log in'
  end

  feature 'Sign up >' do
    scenario 'Sign up with valid information' do
      sign_up(user_a)

      expect(page).to have_content('Successfully created!')
    end
  end

  feature 'Sign in >' do
    scenario 'Sign in with valid credentials' do
      sign_up(user_b)
      click_on 'Logout'
      log_in(user_b)

      expect(page).to have_content('Signed in successfully!')
    end

    scenario 'Try to Sign in with invalid credentials' do
      visit login_path
      fill_in 'Username', with: 'wrong username'
      click_on 'Log in'

      expect(page).to have_content('Invalid name')
    end
  end
end
