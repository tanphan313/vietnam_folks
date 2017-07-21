class CreateCategoryBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :category_backgrounds do |t|
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
