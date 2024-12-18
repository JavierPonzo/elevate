class Post < ApplicationRecord
  include PgSearch::Model

  belongs_to :doctor, optional: true
  has_many :question_answers, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :title, presence: true
  validates :content, presence: true
  validates :category, presence: true
  validate :photos
  has_neighbors :embedding
  after_create :set_embedding

  pg_search_scope :elevate_search,
  against: [:title, :content],
  # associated_against: {
    # category: [:name]
 # },
  using: {
    tsearch: { prefix: true }
  }

  after_create :set_embedding

  private

  def set_embedding
    client = OpenAI::Client.new
    response = client.embeddings(
      parameters: {
        model: 'text-embedding-3-small',
        input: "Post: #{title}. Description: #{content}"
      }
    )
    embedding = response['data'][0]['embedding']
    update(embedding: embedding)
  end
end
