require "rails_helper"

feature "Question maker sucessfully sets up a quesiton" do
  scenario "from the home page" do
    visit root_path

    fill_in "ASK A QUESTION", with: "What should we watch tonight?"
    fill_in "CREATE A PASSCODE", with: "9876"
    click_button "CREATE QUESTION"

    expect(page).to have_content "What should we watch tonight?"
    expect(page).to_not have_content "Error"
  end

  scenario "from the /questions/new page" do
    visit new_question_path

    fill_in "ASK A QUESTION", with: "What should we watch tonight?"
    fill_in "CREATE A PASSCODE", with: "9876"
    click_button "CREATE QUESTION"

    expect(page).to have_content "What should we watch tonight?"
    expect(page).to_not have_content "Error"
  end
end

feature "Question maker receives error messages" do
  scenario "when submitting form without question" do
    visit root_path

    fill_in "CREATE A PASSCODE", with: "9876"
    click_button "CREATE QUESTION"

    expect(page).to have_content "Error: Question text can't be blank"
  end

  scenario "when submitting form without passcode" do
    visit new_question_path

    fill_in "ASK A QUESTION", with: "What should we watch tonight?"
    click_button "CREATE QUESTION"

    expect(page).to have_content "Error: Passcode is not a number and Passcode is the wrong length (should be 4 characters)"
  end

  scenario "when submitting passcode that is not a number" do
    visit new_question_path

    fill_in "ASK A QUESTION", with: "What should we watch tonight?"
    fill_in "CREATE A PASSCODE", with: "pass"
    click_button "CREATE QUESTION"

    expect(page).to have_content "Error: Passcode is not a number"
  end

  scenario "when submitting passcode that is the wrong length" do
    visit new_question_path

    fill_in "ASK A QUESTION", with: "What should we watch tonight?"
    fill_in "CREATE A PASSCODE", with: "987"
    click_button "CREATE QUESTION"

    expect(page).to have_content "Error: Passcode is the wrong length (should be 4 characters)"
  end
end
