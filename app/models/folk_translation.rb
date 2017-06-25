class FolkTranslation < ApplicationRecord
  PARAMS_ATTRIBUTES = [:id, :m_language_id, :name, :introduction, :population,
    :residence_area, :community_organization,
    feature_translations_attributes: FeatureTranslation::PARAMS_ATTRIBUTES]

  belongs_to :folk, class_name: M::Folk, foreign_key: :m_folk_id
  belongs_to :language, class_name: M::Language, foreign_key: :m_language_id

  has_many :feature_translations, dependent: :destroy

  accepts_nested_attributes_for :feature_translations

  scope :by_language, -> language_id {where(m_language_id: language_id)}
end
