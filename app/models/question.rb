class Question < ApplicationRecord
  belongs_to :category

  has_many :question_answers, dependent: :destroy

  accepts_nested_attributes_for :question_answers, reject_if: ->a{a[:content].blank?},
    allow_destroy: true

  scope :random_questions, ->{order "RANDOM() LIMIT 10"}
end
