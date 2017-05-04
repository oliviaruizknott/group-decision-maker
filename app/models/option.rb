require_relative 'response'

class Option < ApplicationRecord
  belongs_to :question
  has_many :responses

  validates :text, presence: true

  def all_scores
    responses.pluck(:score)
  end

  def score
    all_scores.sum
  end
end
