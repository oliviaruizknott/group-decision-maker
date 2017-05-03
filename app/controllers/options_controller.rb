class OptionsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @options = @question.options
    @option = Option.new
  end

  def create
    @question = Question.find(params[:question_id])
    @option = Option.new(option_params_create)
    @option.question = @question

    if @option.save
      redirect_to question_options_path(@question)
    else
      flash.now[:alert] = @option.errors.full_messages.to_sentence
      @options = @question.options
      render :index
    end
  end

  private

  def option_params_create
    params.require(:option).permit(:option_text)
  end
end
