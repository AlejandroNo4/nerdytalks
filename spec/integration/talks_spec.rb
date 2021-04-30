require 'rails_helper'

RSpec.describe 'Talks >', type: :feature do
  let(:user_a) do
    User.new(username: 'Pablito', full_name: 'Pablito Pants',
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

  feature 'Create a Talk >' do
    scenario 'Create a Talk after logged in' do
      sign_up(user_a)
      click_on 'Home page'
      fill_in 'TALK ABOUT SOMETHING', with: "text\n"

      expect(page).to have_content('Talk created!')
    end

    scenario 'Try to create an empty talk' do
      log_in(user_a)
      click_on 'Home page'
      fill_in 'TALK ABOUT SOMETHING', with: "\n"

      expect(page).not_to have_content('Talk created!')
    end

    scenario 'Try create a Talk without been logged in' do
      visit root_path
      fill_in 'TALK ABOUT SOMETHING', with: "text\n"

      expect(page).not_to have_content('text')
    end
  end
end
