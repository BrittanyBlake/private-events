require 'rails_helper'

RSpec.feature 'Event management', type: :feature do
    before :each do
        User.create(username: "jane")
        visit login_url
        fill_in 'session_name', with: 'jane'
        click_button('login')
        expect(page).to have_content 'current user: jane'
    end

    scenario "Has a create event page" do
        visit '/events/new'
        expect(page).to have_content 'create event'
    end

    scenario "Allows user to create an event" do
         visit '/events/new'
         fill_in 'event_date', with: '2020-12-12'
         fill_in 'event_title', with: 'Event title'
         fill_in 'event_description', with: 'Event description'
         click_button('Create Event')

         expect(Event.nil?).to be false
    end

    scenario "does not allow user to create an event without date" do
         visit '/events/new'
         fill_in 'event_date', with: ' '
         fill_in 'event_title', with: 'Event title'
         fill_in 'event_description', with: 'Event description'
         click_button('Create Event')

       expect(page).to have_content("something went wrong")
    end

    scenario "does not allow user to create an event without an event title" do
         visit '/events/new'
         fill_in 'event_date', with: '2020-12-12'
         fill_in 'event_title', with: ' '
         fill_in 'event_description', with: 'Event description'
         click_button('Create Event')

       expect(page).to have_content("something went wrong")
    end

    scenario "does not allow user to create an event without even description" do
         visit '/events/new'
         fill_in 'event_date', with: '2020-12-12'
         fill_in 'event_title', with: 'Event title'
         fill_in 'event_description', with: ' '
         click_button('Create Event')

       expect(page).to have_content("something went wrong")
    end
  
end
