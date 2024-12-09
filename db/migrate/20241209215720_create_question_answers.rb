class CreateQuestionAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :question_answers do |t|
      t.string :question
      t.string :answer
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
