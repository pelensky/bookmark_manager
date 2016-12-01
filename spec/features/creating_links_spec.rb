require 'spec_helper'
require "./app/models/link.rb"

feature 'Add link' do
  scenario 'Adds link to the database' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://google.com'
    page.fill_in :title, :with => 'Google'
    click_button "Submit"
    expect(page).to have_content('Google')
  end

  scenario 'Adds tags to the database' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://www.facebook.com'
    page.fill_in :title, :with => 'Facebook'
    page.fill_in :tag, :with => 'Social Media'
    click_button "Submit"
    expect(page).to have_content('Social Media')
  end
end
