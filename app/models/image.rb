class Image < ApplicationRecord
  mount_uploader :picture, ImageUploader

  PARAMS_ATTRIBUTES = [:id, :picture, :_destroy,
    image_description_translations_attributes: ImageDescriptionTranslation::PARAMS_ATTRIBUTES]

  belongs_to :imageable, polymorphic: true

  has_many :image_description_translations, dependent: :destroy
  has_many :image_feature_translations, dependent: :destroy
  has_many :feature_translations, through: :image_feature_translations

  accepts_nested_attributes_for :image_description_translations
end
