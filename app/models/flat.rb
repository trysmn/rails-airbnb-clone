class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews
  validates :title, :address_line, :postal_code, :city, :country, :pictures, :max_guests, :price, :description, presence: true

  has_attachments :pictures, maximum: 10

  geocoded_by :address_line
  after_validation :geocode, if: :address_line_changed?

end
