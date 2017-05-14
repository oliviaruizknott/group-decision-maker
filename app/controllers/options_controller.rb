class OptionsController < ApplicationController
  def show
    @option = Option.find(params[:id])
    @question = @option.question
    @options = @question.options

    @response = Response.new
    @votes = [
      ["No. Absolutely not.", -3],
      ["Meh. Fine.", -1],
      ["Sure! Sounds good.", 1],
      ["YES PLEASE!!!", 2]
    ]
  end

  def new
    @question = Question.find(params[:question_id])
    @options = @question.options
    @option = Option.new

    if @question.status == "closed"
      redirect_to question_results_path(@question)
    end
  end

  def create
    @question = Question.find(params[:question_id])
    @option = Option.new(option_params_create)
    @option.question = @question

    if @option.save
      redirect_to new_question_option_path(@question)
    else
      flash.now[:alert] = @option.errors.full_messages.to_sentence
      @options = @question.options
      render :new
    end
  end

  private

  def option_params_create
    params.require(:option).permit(:text, :notes)
  end
end
