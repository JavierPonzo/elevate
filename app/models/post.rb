class Post < ApplicationRecord
  belongs_to :doctor, optional: true
  has_many :question_answers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validate :photos
end
