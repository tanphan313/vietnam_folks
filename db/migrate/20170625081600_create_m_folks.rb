class CreateMFolks < ActiveRecord::Migration[5.0]
  def change
    create_table :m_folks do |t|
      t.string :name
      t.integer :sort

      t.timestamps
    end
  end
end
