class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.references :doctor, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
