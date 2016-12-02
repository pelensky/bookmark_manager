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
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario "user tries to sign up without and email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end


  scenario "the user tries to sign up a second time" do
    sign_up
    expect{ sign_up }.to_not change(User, :count)
    expect(page).to have_content("Email is already taken")
  end
end
