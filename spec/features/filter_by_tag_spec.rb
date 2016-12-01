require 'spec_helper'
require "./app/models/link.rb"

feature 'Filter' do
  scenario 'User wants to search for the tag bubbles' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://www.bubbles.com'
    page.fill_in :title, :with => 'Blow Bubbles'
    page.fill_in :tag, :with => 'bubbles'
    click_button "Submit"
    visit '/tags/bubbles'
    expect(page).to have_content('Bubbles')
  end
end
