require 'spec_helper'
require "./app/app.rb"

feature 'Add link' do
  scenario 'Adds link to the database' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://google.com'
    page.fill_in :title, :with => 'Google'
    click_button "Submit"
    expect(page).to have_content('Google')
  end
end
