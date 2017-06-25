class FolkCategoryTranslation < ApplicationRecord
  belongs_to :folk_category
  belongs_to :language, class_name: M::Language, foreign_key: :m_language_id

  scope :by_language, -> language_id {where(m_language_id: language_id)}
end
