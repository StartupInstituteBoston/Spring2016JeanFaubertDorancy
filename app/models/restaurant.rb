class Restaurant < ActiveRecord::Base
  belongs_to :user
  attr_accessor :map_url
  validates :name, :description, :full_address, :phone_number, presence: true
  validates :phone_number, phony_plausible: true
  
  def map_url
    url = "https://maps.googleapis.com/maps/api/staticmap"
    url += "?center=#{full_address}&zoom=18&size=500x500"
    url += "&markers=color:red%7C#{full_address}&key=#{ENV['GOOGLE_MAPS']}"
  end
end
