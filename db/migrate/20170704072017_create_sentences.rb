class CreateSentences < ActiveRecord::Migration[5.0]
  def change
    create_table :sentences do |t|
      t.string :content
      t.string :meaning
      t.string :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
