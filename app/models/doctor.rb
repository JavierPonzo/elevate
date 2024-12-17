class Doctor < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :question_answers, through: :posts
  has_many :appointments

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end