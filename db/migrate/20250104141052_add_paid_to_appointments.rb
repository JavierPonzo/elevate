class AddPaidToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :paid, :boolean
  end
end
