class ChangeDescriptionTypeFeatureTranslation < ActiveRecord::Migration[5.0]
  def change
    change_column :feature_translations, :description, :text
  end
end
