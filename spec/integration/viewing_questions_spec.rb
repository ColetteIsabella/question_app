require "spec_helper"

feature "Viewing questions" do
  scenario "Listing all questions" do
    question = Factory.create(:question, title: "Good Questions")
    visit "/"
    click_link "Good Question"
    page.current_url.should == question_url(question)
  end
end
