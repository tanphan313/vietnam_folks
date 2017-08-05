class Question < ApplicationRecord
  PARAMS_ATTRIBUTES = [:id, image_attributes: Image::PARAMS_ATTRIBUTES]

  belongs_to :category

  has_many :question_answers, dependent: :destroy

  has_one :image, as: :imageable

  delegate :picture, :picture_url, to: :image, prefix: false, allow_nil: true

  accepts_nested_attributes_for :image, allow_destroy: true
  accepts_nested_attributes_for :question_answers, reject_if: ->a{a[:content].blank?},
    allow_destroy: true

  scope :random_questions, ->{order "RANDOM() LIMIT 10"}
end
