class Word < ApplicationRecord
  belongs_to :category

  has_one :background, class_name: WordBackground, foreign_key: :word_id, dependent: :destroy

  delegate :picture_url, to: :background, prefix: true, allow_nil: true

  accepts_nested_attributes_for :background, allow_destroy: true
end
