class Vote < ApplicationRecord
  validates :vote_text, presence: true
  validates :score, presence: true
end
