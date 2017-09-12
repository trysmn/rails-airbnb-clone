class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :title, :address_line, :postal_code, :city, :country, :pictures, :max_guests, :price, :description, presence: true

  has_attachments :pictures

end
