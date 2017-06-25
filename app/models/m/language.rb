class M::Language < ApplicationRecord
  has_many :image_description_translations, foreign_key: :m_language_id
end
