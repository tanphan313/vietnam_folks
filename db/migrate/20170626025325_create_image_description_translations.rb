class CreateImageDescriptionTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :image_description_translations do |t|
      t.references :image, foreign_key: true
      t.string :content
      t.references :m_language, foreign_key: true

      t.timestamps
    end
  end
end
