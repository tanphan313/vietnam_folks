class CreateQuestionAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :question_answers do |t|
      t.string :content
      t.references :question, foreign_key: true
      t.boolean :correct

      t.timestamps
    end
  end
end
