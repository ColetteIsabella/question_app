require 'spec_helper'

feature "Creating Answers" do
  before do
    Factory(:question, :title => "Good Answer")
    user = Factory(:user, :email => "user@curiosity.com")
    user.confirm!

    visit '/'
    click_link "Good Answer"
    click_link "New Answer"
    page.should have_content("You need to sign in or sign up before continuing.")

    fill_in "Email", :with => "user@curiosity.com"
    fill_in "Password", :with => "password"
    click_button "Sign in"
    within("h2") { page.should have_content("New Answer") }
    end

  scenario "Creating an answer" do
    fill_in "Title", :with => "Decent answer"
    fill_in "Response", :with => "So obvious!"
    click_button "Create Answer"
    page.should have_content("Answer has been created.")
    within("#answer #author") do
    page.should have_content("Created by user@curiosity.com")
    end
  end

  scenario "Creating an answer without valid attributes fails" do
    click_button "Create Answer"
    page.should have_content("Answer has not been created.")
    page.should have_content("Title can't be blank")
    page.should have_content("Response can't be blank")
  end
end
