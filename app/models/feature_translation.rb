class FeatureTranslation < ApplicationRecord
  PARAMS_ATTRIBUTES = [:id, :description, images_attributes: Image::PARAMS_ATTRIBUTES]

  belongs_to :folk_translation

  has_many :image_feature_translations, dependent: :destroy
  has_many :images, through: :image_feature_translations

  enum feature_type: [:traditional_customed, :traditional_music, :dwelling_house, :religion, :traditional_food]

  accepts_nested_attributes_for :images, allow_destroy: true

  delegate :folk, to: :folk_translation, prefix: false, allow_nil: true
  delegate :m_language_id, to: :folk_translation, prefix: false, allow_nil: true

  scope :by_other_language, -> language_id do
    joins(:folk_translation).where.not(folk_translations: {m_language_id: language_id})
  end

  scope :by_language, -> language_id do
    joins(:folk_translation).where(folk_translations: {m_language_id: language_id})
  end
end
