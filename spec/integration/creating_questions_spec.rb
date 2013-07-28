require "spec_helper"

feature "Creating Questions" do
  before do
    visit "/"
    click_link "New Question"
  end

  scenario "can create a question" do
    fill_in "Title", :with => "Good Question"
    click_button "Create Question"
    page.should have_content("Question has been created.")

    question = Question.find_by_title("Good Question")
    page.current_url.should == question_url(question)
    title = "Good Question - Questions - question_app"
    find("title").should have_content(title)
  end

  scenario "can not create a question without a title" do
    click_button "Create Question"
    page.should have_content("Question has not been created.")
    page.should have_content("Title can't be blank")
  end
end
