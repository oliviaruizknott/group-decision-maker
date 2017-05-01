class Question < ApplicationRecord
  has_many :options
  
  validates :question_text, presence: true
end
