class ImageDescriptionTranslation < ApplicationRecord
  PARAMS_ATTRIBUTES = [:id, :description_content, :m_language_id]

  belongs_to :image
  belongs_to :language, class_name: M::Language, foreign_key: :m_language_id

  scope :by_language, -> language_id {where(m_language_id: language_id)}
end
