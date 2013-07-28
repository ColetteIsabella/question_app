require 'spec_helper'

feature "Editing Questions" do
  before do
    Factory(:question, :title => "Good Question")
    visit "/"
    click_link "Good Question"
    click_link "Edit Question"
  end

  scenario "Updating a question" do
    fill_in "Title", :with => "Better Question"
    click_button "Update Question"
    page.should have_content("Question has been updated.")
  end

  scenario "Updating a question with invalid attributes fails" do
    fill_in "Title", with: ""
    click_button "Update Question"
    page.should have_content("Question has not been updated.")
  end
end
