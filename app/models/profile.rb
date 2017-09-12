class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :profile_pic, uniqueness: true, presence: true
end
