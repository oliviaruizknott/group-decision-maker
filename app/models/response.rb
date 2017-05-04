class Response < ApplicationRecord
  belongs_to :option

  validates :score, presence: true
end
