class OptionSerializer < ActiveModel::Serializer
  attributes :id, :text, :notes, :question_id, :score, :all_scores, :next_option

  has_many :responses
end
