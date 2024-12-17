class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  validates :date, presence: true
  validates :rating, presence: true

  private

  def set_default_status
    self.status ||= "Pending"
  end
end
