class Post < ApplicationRecord
  include PgSearch::Model

  belongs_to :doctor
  has_many :question_answers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :title, :content, :category, presence: true
  validate :at_least_one_photo

  has_neighbors :embedding
  after_create :set_embedding

  pg_search_scope :elevate_search,
    against: [:title, :content],
    using: { tsearch: { prefix: true } }

  private

  def at_least_one_photo
    errors.add(:photos, "Debe incluir al menos una foto") if photos.blank?
  end

  def set_embedding
    begin
      client = OpenAI::Client.new
      response = client.embeddings(
        parameters: {
          model: 'text-embedding-ada-002',
          input: "Post: #{title}. Description: #{content}"
        }
      )
      embedding = response['data'][0]['embedding']
      update_column(:embedding, embedding)
    rescue StandardError => e
      Rails.logger.error "Error setting embedding: #{e.message}"
    end
  end
end
