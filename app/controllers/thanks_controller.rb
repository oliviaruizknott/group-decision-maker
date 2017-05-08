class ThanksController < ApplicationController
  def index
    @question = Question.find(params[:question_id])

    if @question.status == "closed"
      redirect_to question_results_path(@question)
    end
  end
end
