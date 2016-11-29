require 'spec_helper'

feature "Homepage" do
  scenario "User expects to see list of links after logging in" do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

    visit './links'

    within 'ul#links' do
    expect(page).to have_content('Makers Academy')
    end
  end
end
