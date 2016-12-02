require 'spec_helper'
require './spec/web_helper'
require "./app/app.rb"

feature "sign up" do
  scenario "allows a user to sign up" do
    expect { sign_up }.to change(User, :count). by(1)
    expect(page).to have_content("Hey there, test@test.com!")
    expect(User.first.email).to eq('test@test.com')
  end

  scenario "passwords must match" do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
      expect(current_path).to eq('/users')
      expect(page).to have_content "Password and confirmation do not match. Please try again"
  end


end
