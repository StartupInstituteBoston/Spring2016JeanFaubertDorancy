class Restaurant < ActiveRecord::Base
  validates :name, :description, :full_address, :phone_number, presence: true
end
