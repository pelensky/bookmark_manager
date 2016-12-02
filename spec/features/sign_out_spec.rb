require 'spec_helper'
require './spec/web_helper'
require "./app/app.rb"

feature "sign out" do
  scenario "user signs out" do
    sign_up
    sign_in
    click_button 'Sign out'
    expect(page).to have_content('goodbye')
    expect(page).not_to have_content("Hey there, test@test.com")
  end
end
