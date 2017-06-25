class RemoveTeaserAndBackgroundFieldFolkTranslations < ActiveRecord::Migration[5.0]
  def change
    remove_column :folk_translations, :teaser_image
    remove_column :folk_translations, :background_image
  end
end
