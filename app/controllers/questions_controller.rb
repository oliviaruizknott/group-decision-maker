class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @options = @question.options
    @option = @options.first
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params_create)

    if @question.save
      redirect_to question_options_path(@question.id)
    else
      flash.now[:alert] = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def question_params_create
    params.require(:question).permit(:text, :passcode)
  end
end
