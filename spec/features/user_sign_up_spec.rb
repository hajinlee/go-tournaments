require "spec_helper"

describe "user sign up path", type: :feature do
  before do
    visit "/accounts/sign_up"
  end

  context "valid sign up" do
    it "saves a new user" do
      fill_in "First Name:", with: "Iron"
      fill_in "Last Name:", with: "Man"
      fill_in "Email:", with: "iron@man.com"
      fill_in "Password:", with: "123456"
      fill_in "Password Confirmation:", with: "123456"
      click_button "Sign up"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end
  end

  context "given invlaid email" do
    it "asks to correct email" do
      fill_in "First Name:", with: "Iron"
      fill_in "Last Name:", with: "Man"
      fill_in "Email:", with: "ironman"
      fill_in "Password:", with: "123456"
      fill_in "Password Confirmation:", with: "123456"
      click_button "Sign up"
      expect(page).to have_content "invalid"
    end
  end

  context "given existing email" do
    it "alerts it is taken" do
      fill_in "First Name:", with: "Iron"
      fill_in "Last Name:", with: "Man"
      fill_in "Email:", with: "iron@man.com"
      fill_in "Password:", with: "123456"
      fill_in "Password Confirmation:", with: "123456"
      click_button "Sign up"
      expect(page).to have_content "Email has already been taken"
    end
  end
end
