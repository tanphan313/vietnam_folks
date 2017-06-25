class ChangeColumnNameFeatureTranslations < ActiveRecord::Migration[5.0]
  def change
    rename_column :feature_translations, :type, :feature_type
  end
end
