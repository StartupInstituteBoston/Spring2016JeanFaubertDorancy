class Restaurant < ActiveRecord::Base
  belongs_to :owner, foreign_key: "owner_id", class_name: "User"
  attr_accessor :map_url
  validates :name, :description, :full_address, :phone_number, presence: true
  
  def map_url
    url = "https://maps.googleapis.com/maps/api/staticmap"
    url += "?center=#{full_address}&zoom=18&size=500x500"
    url += "&markers=color:red%7C#{full_address}&key=#{ENV['GOOGLE_MAPS']}"
  end
end
