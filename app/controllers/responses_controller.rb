class ResponsesController < ApplicationController
  def create
    @option = Option.find(params[:option_id])
    @question = @option.question
    @options = @question.options

    @next_option = Option.where("id > ?", @option.id).first
    @previous_option = Option.where("id < ?", @option.id).first
    @last_option = @options.last

    @response = Response.new(response_params_create)
    @response.option = @option

    if @response.save
      if @option == @last_option
        redirect_to question_thanks_path(@question)
      else
        redirect_to "/options/#{@next_option.id}"
      end
    else
      flash.now[:alert] = @option.errors.full_messages.to_sentence
      @options = @question.options
      redirect_to "/options/#{@option.id}"
    end
  end

  private

  def response_params_create
    params.require(:response).permit(:score)
  end
end
