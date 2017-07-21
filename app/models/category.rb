class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :sentences, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :lessons, dependent: :destroy

  has_one :background, class_name: CategoryBackground, foreign_key: :category_id, dependent: :destroy

  delegate :picture_url, to: :background, prefix: true, allow_nil: true

  accepts_nested_attributes_for :words, allow_destroy: true
  accepts_nested_attributes_for :sentences, allow_destroy: true
  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :background, allow_destroy: true
end
