require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  before :each do
    User.create(username: 'jane')
  end

  scenario 'Has a sign in page' do
    visit login_url
    expect(page).to have_content 'sign in'
  end

  scenario 'Sign in a user' do
    visit login_url
    fill_in 'session_name', with: 'jane'
    click_button('login')
    expect(page).to have_content 'current user: jane'
  end

  scenario 'Redirects to user show page after loggin in' do
    visit login_url
    fill_in 'session_name', with: 'jane'
    click_button('login')
    expect(page).to have_current_path(user_path(User.last.id))
  end

  scenario 'Redirects to user sign in page after unsuccessful loggin in attempt' do
    visit login_url
    fill_in 'session_name', with: 'john'
    click_button('login')
    expect(page).to have_current_path(login_path)
  end
end
