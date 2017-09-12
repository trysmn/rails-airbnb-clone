class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :flat
  validates :content, presence: true
  validates :rating, inclusion: { in: [1,2,3,4,5], message: "Please rate your experience from 1 (bad) to 5 (excellent)" }, presence: true
end
