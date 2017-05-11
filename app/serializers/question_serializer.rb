class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :text, :passcode, :status, :result, :result_details, :high_score

  has_many :options
end
