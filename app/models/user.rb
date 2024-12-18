class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :doctor
  has_many :reviews
  has_many :question_answers
  has_many :appointments
  # after_save :create_doctor
  has_many :questions
  has_one_attached :photo

  def doctor?
    role == "doctor"
  end

  def patient?
    role == "patient"
  end

  # def create_doctor
  #   if role == "doctor"
  #     Doctor.find_or_create_by(user_id: id)
  #   end
  # end
end
