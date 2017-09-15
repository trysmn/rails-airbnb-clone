class Profile < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, presence: true
  validates :profile_pic, presence: true
  has_attachment :profile_pic, maximum: 1
end
