require_relative 'response'

class Option < ApplicationRecord
  belongs_to :question
  has_many :responses

  validates :text, presence: true

  def score
    all_scores = responses.pluck(:score)
    all_scores.sum
  end

end
