class Post < ApplicationRecord
  belongs_to :doctor
  has_many :question_answers
  has_many :reviews
end
