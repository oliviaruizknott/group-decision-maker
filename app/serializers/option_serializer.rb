class OptionSerializer < ActiveModel::Serializer
  attributes :id, :text, :notes, :question_id, :score, :all_scores

  has_many :responses
end
