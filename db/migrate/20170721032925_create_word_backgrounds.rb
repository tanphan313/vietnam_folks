class CreateWordBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :word_backgrounds do |t|
      t.references :word, foreign_key: true

      t.timestamps
    end
  end
end
