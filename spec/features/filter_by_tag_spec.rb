require 'spec_helper'
require "./app/models/link.rb"

feature 'Filter' do
  scenario 'User wants to search for the tag bubbles' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://www.bubbles.com'
    page.fill_in :title, :with => 'Blow Bubbles'
    page.fill_in :tag, :with => 'bubbles'
    click_button "Submit"
    visit '/links/new'
    page.fill_in :url, :with => 'http://www.facebook.com'
    page.fill_in :title, :with => 'Facebook'
    page.fill_in :tag, :with => 'social'
    click_button "Submit"

    page.fill_in :filter_by_tag, :with => 'bubbles'
    click_button "Filter"
    expect(page).not_to have_content('social')
  end
end
