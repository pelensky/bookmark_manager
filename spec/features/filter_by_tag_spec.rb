require 'spec_helper'
require "./app/models/link.rb"

feature 'Filter' do
  scenario 'User wants to search for the tag bubbles' do
    visit '/tags/bubbles'
    expect(page).to have_content('Bubbles')
  end
end
