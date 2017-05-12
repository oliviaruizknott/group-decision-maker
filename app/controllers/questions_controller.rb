class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @options = @question.options
    @option = @options.first

    if @question.status == "closed"
      redirect_to question_results_path(@question)
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params_create)

    if @question.save
      redirect_to new_question_option_path(@question.id)
    else
      flash.now[:alert] = @question.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])

    if params[:question][:passcode] == @question.passcode
      @question.status = "closed"
      @question.save
      @new_question = @question
      redirect_to question_results_path(@new_question)
    elsif params[:question][:passcode] == ""
      flash.now[:alert] = "To close this question, you must enter the 4 digit passcode."
      render 'results/index'
    else
      flash.now[:alert] = "Passcode is incorrect."
      render 'results/index'
    end
  end

  private

  def question_params_create
    params.require(:question).permit(:text, :passcode)
  end

  def question_params_update
    params.require(:question).permit(:status)
  end
end
