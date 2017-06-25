class ChangeImageableColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :imageable, :imageable_id
  end
end
