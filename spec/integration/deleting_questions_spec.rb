require 'spec_helper'
feature "Deleting questions" do
  scenario "Deleting a question" do
    Factory(:question, :title => "Good Question")
    visit "/"
    click_link "Good Question"
    click_link "Delete Question"
    page.should have_content("Question has been deleted.")

  visit "/"
    page.should_not have_content("Good Question")
  end
end
