class CreateImageFeatureTranslations < ActiveRecord::Migration[5.0]
  def change
    create_table :image_feature_translations do |t|
      t.references :image, foreign_key: true
      t.references :feature_translation, foreign_key: true

      t.timestamps
    end
  end
end
