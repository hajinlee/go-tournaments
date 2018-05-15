require 'rails_helper'

RSpec.describe User, type: :model do

  context "when initialized" do
    it "is not yet valid" do
      expect(User.new).not_to be_valid
    end
  end

  describe 'email' do
    let(:capital) { 'Asdf@example.com' }
    it 'is downcased when saved' do
      u = create(:user, email: capital)
      expect(u.reload.email).to eq(capital.downcase)
      expect(User.find_by(email: capital.downcase)).to eq(u)
      expect(User.find_by(email: capital)).to eq(nil)
    end
  end

  describe '#valid' do
    it "is invalid if email is invalid" do
      user = build :user, :email => "herpderp"
      expect(user).not_to be_valid
      expect(user.errors).to include(:email)
    end

    it "is invalid if email is not unique" do
      extant = create :user, :email => "John@example.com"
      user = build :user, {email: extant.email}
      expect(user).not_to be_valid
      expect(user.errors).to include(:email)
    end

    it "returns false if password is blank" do
      expect(build(:user, :password => "")).to have_error_about(:password)
    end

    it "returns false if password is too short" do
      expect(build(:user, :password => "12345")).to have_error_about(:password)
    end

    it "returns false if the password is not confirmed" do
      expect(build(:user, :password_confirmation => "")).to \
        have_error_about(:password_confirmation)
    end
  end

end
