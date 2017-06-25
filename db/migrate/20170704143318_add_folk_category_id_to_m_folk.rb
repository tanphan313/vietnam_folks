class AddFolkCategoryIdToMFolk < ActiveRecord::Migration[5.0]
  def change
    add_column :m_folks, :folk_category_id, :integer
  end
end
