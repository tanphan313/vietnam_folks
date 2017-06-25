class CreateMLanguages < ActiveRecord::Migration[5.0]
  def change
    create_table :m_languages do |t|
      t.string :name

      t.timestamps
    end
  end
end
