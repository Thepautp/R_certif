class Question < ApplicationRecord
  belongs_to :categorie
  has_many :good_answers
  has_many :bad_answers
end
