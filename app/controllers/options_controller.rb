class OptionsController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @options = @question.options
    @option = Option.new
  end

  def show
    @question = Question.find(params[:question_id])
    @option = Option.find(params[:id])
    @options = @question.options
    @response = Response.new
    @votes = [
      ["No. Absolutely not.", -3],
      ["Meh. Fine.", -1],
      ["Sure! Sounds good.", 1],
      ["YES PLEASE!!!", 2]
    ]
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
    params.require(:option).permit(:text)
  end
end
