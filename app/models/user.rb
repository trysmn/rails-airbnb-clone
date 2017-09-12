class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :flats
  has_many :bookings
  has_one :profile
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
end
