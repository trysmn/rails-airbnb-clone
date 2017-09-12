class Perk < ApplicationRecord
  has_one :perks_quantity
  validates :name, uniqueness: true, presence: true
end
