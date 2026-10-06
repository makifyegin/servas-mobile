require 'rails_helper'

RSpec.describe Region, type: :model do
  it "has a valid factory" do
    region = build(:region)
    expect(region).to be_valid
  end
end
