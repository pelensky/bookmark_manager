require 'spec_helper'
require "./app/app.rb"

feature "Homepage" do
  scenario "User expects to see list of links after logging in" do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
