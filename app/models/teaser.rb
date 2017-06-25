class Teaser < ApplicationRecord
  PARAMS_ATTRIBUTES = [:id, image_attributes: Image::PARAMS_ATTRIBUTES]

  belongs_to :folk, class_name: M::Folk, foreign_key: :m_folk_id

  has_one :image, as: :imageable

  delegate :picture, :picture_url, to: :image, prefix: false, allow_nil: true

  accepts_nested_attributes_for :image, allow_destroy: true
end
