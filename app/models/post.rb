class Post < ApplicationRecord
  belongs_to :doctor, optional: true
  has_many :question_answers
  has_many :reviews
  has_many_attached :photos
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validate :photos
end
