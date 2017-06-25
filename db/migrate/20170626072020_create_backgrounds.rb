class CreateBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :backgrounds do |t|
      t.references :m_folk, foreign_key: true

      t.timestamps
    end
  end
end
