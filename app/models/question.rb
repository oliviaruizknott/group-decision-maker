class Question < ApplicationRecord
  has_many :options

  validates :text, presence: true
  validates :passcode, numericality: { only_integer: true }, length: { is: 4 }

  def result_details
    hash = {}
    options.each do |option|
      hash[option.text] = option.score
    end
    hash
  end

  def result
    array = []
    result_details.each do |option, score|
      if score == result_details.values.max
        array << option
      end
    end
    array
  end

  def high_score
    result_details.values.max
  end

  def last_option
    options.last.id
  end
end

# This gives only one winner:
# result_details.key(result_details.values.max)
