class ResultsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
  end
end
