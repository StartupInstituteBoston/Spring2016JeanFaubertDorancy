require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it "should not be valid without attributes" do
  	restaurant = Restaurant.new
  	expect(restaurant.valid?).to be_falsey
  end

  it "should be valid with attributes" do
  	restaurant = Restaurant.new(name: "some name", description: "some text",
  								full_address: "50 milk", phone_number: "8888888888")
  	expect(restaurant.valid?).to be_truthy
  end
end
