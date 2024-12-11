class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :user

  private
  
  def set_default_status
    self.status ||= "Pending"
  end
end
