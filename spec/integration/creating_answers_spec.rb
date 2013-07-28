require 'spec_helper'

feature "Creating Answers" do
  before do
    Factory(:question, :title => "Good Answer")
    visit '/'
    click_link "Good Answer"
    click_link "New Answer"
  end

  scenario "Creating an answer" do
    fill_in "Title", :with => "Decent answer"
    fill_in "Response", :with => "So obvious!"
    click_button "Create Answer"
    page.should have_content("Answer has been created.")
  end

  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Response can't be blank")
  end
end
