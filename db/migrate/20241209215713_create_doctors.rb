class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :license
      t.references :user, null: false, foreign_key: true
      t.string :specialty

      t.timestamps
    end
  end
end
