require "csv"

namespace :master_data do
  desc "Import folk data"
  task import_folk_data: :environment do
    file_path = Rails.root.join "db", "masters", "folk.csv"

    ActiveRecord::Base.transaction do
      CSV.open(file_path, {headers: true}).each do |row|
        params = folk_params(row)
        if folk = M::Folk.find_by(id: params[:id])
          folk.update! params
          M::Language.pluck(:id).each do |language_id|
            folk_translation = FolkTranslation.find_or_create_by(m_language_id: language_id, m_folk_id: folk.id)
            FeatureTranslation.feature_types.each do |feature, feature_type|
              FeatureTranslation.find_or_create_by(feature_type: feature, folk_translation_id: folk_translation.id)
            end
          end
        else
          folk = M::Folk.create! folk_params(row)
          M::Language.pluck(:id).each do |language_id|
            folk_translation = FolkTranslation.find_or_create_by(m_language_id: language_id, m_folk_id: folk.id)
            FeatureTranslation.feature_types.each do |feature, feature_type|
              FeatureTranslation.find_or_create_by(feature_type: feature, folk_translation_id: folk_translation.id)
            end
          end
        end
      end
    end
    p "Finish import folk"
  end

  def folk_params row
    {
      id: row[0],
      name: row[1],
      sort: row[2],
    }
  end
end
