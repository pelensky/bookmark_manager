require 'spec_helper'
require './spec/web_helper'
require "./app/app.rb"

feature "sign up" do
  scenario "allows a user to sign up" do
    expect { sign_up }.to change(User, :count). by(1)
    expect(page).to have_content("Hey there, test@test.com!")
    expect(User.first.email).to eq('test@test.com')
  end
end
