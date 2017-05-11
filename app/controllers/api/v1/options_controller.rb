class Api::V1::OptionsController < ApplicationController
  def index
    @question = Question.all
    @options = @question.options
    render json: @options
  end
end
