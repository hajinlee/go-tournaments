require "spec_helper"

describe "create tournament path", type: :feature do
  before do
    visit "/accounts/sign_in"
    fill_in "Email", with: "iron@man.co"
    fill_in "Password", with: "123456"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end

  context "valid tournament creation" do
    it "saves a new tournament" do
      visit "/tournaments/new"
      fill_in "Tournament Title:", with: "Bot Tournament"
      fill_in "Start Date:", with: "11/11/2022"
      fill_in "End Date:", with: "11/12/2022"
      fill_in "Venue:", with: "go center"
      fill_in "City:", with: "DC"
      fill_in "State:", with: "DC"
      fill_in "Organizer:", with: "test bot"
      fill_in "Contact info:", with: "to the test"
      click_button "Submit"
      expect(page).to have_content "Bot Tournament"
    end
  end

  context "given no organizer info" do
    it "asks user to fill in" do
      visit "/tournaments/new"
      fill_in "Tournament Title:", with: "Bot Tournament"
      fill_in "Start Date:", with: "11/11/2022"
      fill_in "End Date:", with: "11/12/2022"
      fill_in "Venue:", with: "go center"
      fill_in "City:", with: "DC"
      fill_in "State:", with: "DC"
      click_button "Submit"
      expect(page).to have_content "Organizer can't be blank"
    end
  end
end
