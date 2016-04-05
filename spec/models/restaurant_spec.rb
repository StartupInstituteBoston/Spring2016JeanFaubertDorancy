require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  before(:each) do
  	@restaurant = Restaurant.new(name: "some name", description: "some text",
  								 full_address: "50 milk", phone_number: "+18888888888")
  end

  it "should not be valid without attributes" do
  	@restaurant = Restaurant.new
  	expect(@restaurant.valid?).to be_falsey
  end

  it "should be valid with attributes" do
  	expect(@restaurant.valid?).to be_truthy
  end

  it "should test for valid phone_number" do
	@restaurant.phone_number = "1234560000"
  	expect(@restaurant.valid?).to be_falsey
  end
end
