class Question < ApplicationRecord
  has_many :options

  validates :question_text, presence: true
  validates :passcode, numericality: { only_integer: true }, length: { is: 4 }
end
