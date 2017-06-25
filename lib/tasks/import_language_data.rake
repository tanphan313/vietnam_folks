require "csv"

namespace :master_data do
  desc "Import language data"
  task import_language_data: :environment do
    file_path = Rails.root.join "db", "masters", "language.csv"

    ActiveRecord::Base.transaction do
      CSV.open(file_path, {headers: true}).each do |row|
        params = language_params(row)
        if language = M::Language.find_by(id: params[:id])
          language.update! params
        else
          language = M::Language.create! language_params(row)
        end
      end
    end
    p "Finish import language"
  end

  def language_params row
    {
      id: row[0],
      name: row[1]
    }
  end
end
