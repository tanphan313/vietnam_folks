class CreateLessonQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :lesson_questions do |t|
      t.references :lesson, foreign_key: true
      t.references :question, foreign_key: true
      t.references :question_answer, foreign_key: true

      t.timestamps
    end
  end
end
