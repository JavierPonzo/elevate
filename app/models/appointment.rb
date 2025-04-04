class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user
  validates :date, presence: true
  validates :time, presence: true
  # before_save :set_default_status
  validates :status, inclusion: { in: ["Pendiente", "Confirmado", "Cancelado"] }
  attribute :paid, :boolean, default: false

  private

  def set_default_status
    self.status = "Pendiente"
  end
end
