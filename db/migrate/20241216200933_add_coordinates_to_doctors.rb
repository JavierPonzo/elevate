class AddCoordinatesToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :address, :string
    add_column :doctors, :latitude, :float
    add_column :doctors, :longitude, :float
  end
end
