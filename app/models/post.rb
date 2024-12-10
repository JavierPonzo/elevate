class Post < ApplicationRecord
  belongs_to :doctor, optional: true
  has_many :question_answers
  has_many :reviews
  has_many_attached :photos
end
