class ChangeImageableTypeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :imagealbe_type, :imageable_type
  end
end
