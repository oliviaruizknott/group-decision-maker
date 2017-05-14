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

  def last_option?
    id == question.last_option
  end

  def next_option
    if last_option?
      return nil
    else
      Option.where(["id > ? and question_id = ?", id, question.id]).first
    end
  end

end
