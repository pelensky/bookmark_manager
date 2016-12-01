require 'spec_helper'
require "./app/models/link.rb"

feature "tag link" do
  scenario 'Adds multiple tags to the database' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://www.facebook.com'
    page.fill_in :title, :with => 'Facebook'
    page.fill_in :tag, :with => 'social, procrastination, friends'
    click_button "Submit"
    expect(page).to have_content('social')
    expect(page).to have_content('procrastination')
    expect(page).to have_content('friends')
  end
end
