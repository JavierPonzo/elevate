class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :doctor, dependent: :destroy
  has_many :reviews
  has_many :question_answers
  has_many :appointments
  has_many :questions
  has_one_attached :photo
  has_one_attached :avatar

  after_create :create_doctor_if_needed

  validates :name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true, inclusion: { in: ['doctor', 'patient'], message: "debe seleccionar Doctor o Paciente" }

  def doctor?
    role == "doctor"
  end

  def patient?
    role == "patient"
  end

  private

  def create_doctor_if_needed
    Doctor.find_or_create_by(user: self) if doctor?
  end
end
