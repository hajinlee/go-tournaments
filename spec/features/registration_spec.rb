require "spec_helper"

describe "registration path", type: :feature do
  let(:password) { "abcdef" }
  let(:user) { create :user, password: password }

  before do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  context "successful registration" do
    it "shows up on my page" do
      click_link "Create Tournament"
      fill_in "Tournament Title:", with: "Bot Tournament II"
      fill_in "Start Date:", with: "11/11/2022"
      fill_in "End Date:", with: "11/12/2022"
      fill_in "Venue:", with: "go center"
      fill_in "City:", with: "DC"
      fill_in "State:", with: "DC"
      fill_in "Organizer:", with: "test bot"
      fill_in "Contact info:", with: "to the test"
      click_button "Submit"
      expect(page).to have_content "Bot Tournament II"
      click_link "Go Tournaments"
      click_link "Bot Tournament II"
      click_button "Register"
      click_link "My Page"
      expect(page).to have_content "Unregister"
      click_link "Registrations"
      expect(page).to have_content "Bot Tournament II"
      expect(page).to have_content "1 players"
    end
  end

  context "unregister link" do
    it "deletes the registration" do
      visit "/"
      click_link "Bot Tournament II"
      click_button "Register"
      click_link "My Page"
      expect(page).to have_content "Unregister"
      click_link "Unregister"
      expect(page).to have_no_content "Bot Tournament II"
    end
  end
end
