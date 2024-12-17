class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  before_save :set_default_status

  validates :status, inclusion: { in: ["Pendiente", "Confirmado", "Cancelado"] }

  private

  def set_default_status
    self.status ||= "Pendiente"
  end
end
