class CreateFolkCategoryTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :folk_category_translations do |t|
      t.string :name
      t.references :folk_category, foreign_key: true
      t.references :m_language, foreign_key: true

      t.timestamps
    end
  end
end
