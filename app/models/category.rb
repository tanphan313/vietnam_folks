class Category < ApplicationRecord
  has_many :words, dependent: :destroy
  has_many :sentences, dependent: :destroy

  accepts_nested_attributes_for :words
  accepts_nested_attributes_for :sentences
end
