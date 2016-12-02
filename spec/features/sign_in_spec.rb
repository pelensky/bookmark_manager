require 'spec_helper'
require './spec/web_helper'
require "./app/app.rb"

feature "sign in" do
  scenario 'with the right email and password' do
    sign_up
    sign_in
    expect(page).to have_content "Hey there, test@test.com"
  end

  scenario "does not allow sign in with wrong username/password" do
    expect(User.authenticate('test@test.com', 'wrong_password')).to be_nil
  end
end
