class PerkQuantity < ApplicationRecord
  belongs_to :perk
  belongs_to :flat
  validates :quantity, presence: true
end
