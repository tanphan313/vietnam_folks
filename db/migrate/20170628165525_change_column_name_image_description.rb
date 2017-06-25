class ChangeColumnNameImageDescription < ActiveRecord::Migration[5.0]
  def change
    rename_column :image_description_translations, :content, :description_content
  end
end
