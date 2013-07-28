require 'spec_helper'

feature "Editing answers" do
  let!(:question) { Factory(:question) }
  let!(:answer) { Factory(:answer, :question => question) }

  before do
    visit '/'
    click_link question.title
    click_link answer.title
    click_link "Edit Answer"
end
  scenario "Updating an answer" do
    fill_in "Title", :with => "Seriously!"
    click_button "Update Answer"
    page.should have_content "Answer has been updated."
    within("#answer h2") do
    page.should have_content("Seriously!")
    end
    page.should_not have_content answer.title
  end

  scenario "Updating an answer with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Answer"
    page.should have_content("Answer has not been updated.")
  end
end
