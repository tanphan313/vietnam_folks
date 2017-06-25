class M::Folk < ApplicationRecord
  has_many :folk_translations, foreign_key: :m_folk_id, dependent: :destroy
  has_many :feature_translations, through: :folk_translations

  has_one :teaser, foreign_key: :m_folk_id, dependent: :destroy
  has_one :background, foreign_key: :m_folk_id, dependent: :destroy

  belongs_to :folk_category, foreign_key: :folk_category_id

  accepts_nested_attributes_for :folk_translations
  accepts_nested_attributes_for :teaser
  accepts_nested_attributes_for :background

  delegate :picture_url, to: :teaser, prefix: true, allow_nil: true
  delegate :picture_url, to: :background, prefix: true, allow_nil: true

  scope :top_land, -> do
    order("RANDOM()").limit(5)
  end
end
