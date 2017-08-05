require "csv"

namespace :master_data do
  desc "Import folk categories data"
  task import_folk_category_data: :environment do
    file_path = Rails.root.join "db", "masters", "folk_category.csv"

    ActiveRecord::Base.transaction do
      CSV.open(file_path, {headers: true}).each do |row|
        params = folk_category_params(row)
        if folk_category = FolkCategory.find_by(id: params[:id])
          folk_category.update! params
        else
          folk_category = FolkCategory.create! params
        end
        folk_category.folk_ids = row[2].split(",")
      end
    end
    p "Finish import folk_category"

    file_path = Rails.root.join "db", "masters", "folk_category_translation.csv"
    ActiveRecord::Base.transaction do
      CSV.open(file_path, {headers: true}).each do |row|
        params = folk_category_translation_params(row)
        if folk_category_translation = FolkCategoryTranslation.find_by(id: params[:id])
          folk_category_translation.update! params
        else
          folk_category_translation = FolkCategoryTranslation.create! params
        end
      end
    end
    p "Finish import folk_category_translation"
  end

  def folk_category_params row
    {
      id: row[0],
      name: row[1]
    }
  end

  def folk_category_translation_params row
    {
      id: row[0],
      name: row[1],
      m_language_id: row[2],
      folk_category_id: row[3]
    }
  end
end
