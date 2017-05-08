class DetailsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @options = @question.options.sort_by(&:score).reverse

    if @question.status == "open"
      redirect_to question_path(@question)
    end
  end
end
