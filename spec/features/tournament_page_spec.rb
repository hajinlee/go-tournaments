require "spec_helper"

describe "create tournament path", type: :feature do
  let(:password) { "abcdefgh" }
  let(:user) { create :user, password: password }

  before do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  context "valid tournament creation" do
    it "saves a new tournament" do
      visit "/tournaments/new"
      fill_in "Tournament title:", with: "Bot Tournament"
      fill_in "Start date:", with: "11/11/2022"
      fill_in "End date:", with: "11/12/2022"
      fill_in "Venue:", with: "go center"
      fill_in "City:", with: "DC"
      fill_in "State:", with: "DC"
      fill_in "Organizer:", with: "test bot"
      fill_in "Contact info:", with: "to the test"
      click_button "Submit"
      expect(page).to have_content "Bot Tournament"
      click_link "Go Tournaments"
      expect(page).to have_content "Bot Tournament"
    end
  end

  context "given no organizer info" do
    it "asks user to fill in" do
      visit "/tournaments/new"
      fill_in "Tournament title:", with: "Bot Tournament"
      fill_in "Start date:", with: "11/11/2022"
      fill_in "End date:", with: "11/12/2022"
      fill_in "Venue:", with: "go center"
      fill_in "City:", with: "DC"
      fill_in "State:", with: "DC"
      click_button "Submit"
      expect(page).to have_content "Organizer can't be blank"
    end
  end

  context "tournament edit" do
    it "saves a new info" do
      click_link "My Page"
      click_link "Create a tournament"
      fill_in "Tournament title:", with: "Another Tournament"
      fill_in "Start date:", with: "11/11/2022"
      fill_in "End date:", with: "11/12/2022"
      fill_in "Venue:", with: "go center"
      fill_in "City:", with: "DC"
      fill_in "State:", with: "DC"
      fill_in "Organizer:", with: "test bot"
      fill_in "Contact info:", with: "to the test"
      click_button "Submit"
      expect(page).to have_content "Another Tournament"
      click_link "My Page"
      expect(page).to have_content "Another Tournament"
    end
  end


end
