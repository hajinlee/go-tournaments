require 'rails_helper'

RSpec.describe Tournament, type: :model do
  it "has a valid factory" do
    expect(build(:tournament)).to be_valid
  end
end
