require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'Has a sign up page' do
    visit signup_url
    expect(page).to have_content 'sign up'
  end

  scenario 'Sign up a new user' do
    visit signup_url
    fill_in 'username', with: 'jane'
    click_button('sign up')
    expect(page).to have_content 'jane'
  end
end
