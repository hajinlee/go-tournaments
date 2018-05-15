require 'rails_helper'

RSpec.describe User, type: :model do

  context "when initialized" do
    it "is not yet valid" do
      expect(User.new).not_to be_valid
    end
  end

end
