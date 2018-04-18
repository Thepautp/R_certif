class Question < ApplicationRecord
  belongs_to :categorie
  has_many :good_answers, dependent: :destroy
  has_many :bad_answers, dependent: :destroy
end
