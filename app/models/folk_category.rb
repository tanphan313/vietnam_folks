class FolkCategory < ApplicationRecord
  has_many :folks, class_name: M::Folk, foreign_key: :folk_category_id
  has_many :folk_category_translations
end
