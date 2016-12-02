require 'spec_helper'
require "./app/app.rb"

feature "tag link" do
  scenario 'Adds tags to the database' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://www.facebook.com'
    page.fill_in :title, :with => 'Facebook'
    page.fill_in :tag, :with => 'Social Media'
    click_button "Submit"
    expect(page).to have_content('Social Media')
  end
end
