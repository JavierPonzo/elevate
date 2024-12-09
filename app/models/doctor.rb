class Doctor < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :question_answers, through: :posts
  has_many :appointments

end
