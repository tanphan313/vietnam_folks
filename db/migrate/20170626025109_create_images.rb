class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.integer :imageable
      t.string :imagealbe_type
      t.string :picture

      t.timestamps
    end
  end
end
