class CreateFolkTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :folk_translations do |t|
      t.string :name
      t.string :teaser_image
      t.string :background_image
      t.text :introduction
      t.text :population
      t.text :residence_area
      t.text :community_organization
      t.references :m_folk, foreign_key: true
      t.references :m_language, foreign_key: true

      t.timestamps
    end
  end
end
