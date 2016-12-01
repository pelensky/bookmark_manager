require 'spec_helper'
require "./app/models/link.rb"

feature "tag link" do
  scenario 'Adds tags to the database' do
    visit '/links/new'
    page.fill_in :url, :with => 'http://www.facebook.com'
    page.fill_in :title, :with => 'Facebook'
    page.fill_in :tag, :with => 'Social Media'
    click_button "Submit"
    link = Link.create(url: 'http://www.facebook.com', title: 'Facebook')
    tag = Tag.create(tag: 'Social Media')
    require 'pry'; binding.pry
    expect(page).to have_content('Social Media')
  end
end
