require 'spec_helper'

feature "Viewing answers" do
  before do
    good_question = Factory(:question, :title => "Good Question")
    user = Factory(:user)
    answer = Factory(:answer,
            :question => good_question,
            :title => "Seriously!",
            :response => "Too much.")
    answer.update_attribute(:user, user)

    better_question = Factory(:question, :title => "Better Question")
    Factory(:answer,
            :question => better_question,
            :title => "Make it good.",
            :response => "Be articulate.")
      visit '/'
    end

  scenario "Viewing answers for a question" do
    click_link "Good Question"
    page.should have_content("Seriously!")
    page.should_not have_content("Make it good.")
    click_link "Seriously!"
    within("#answer h2") do
    page.should have_content("Seriously!")
    end
    page.should have_content("Too much.")
  end
end
