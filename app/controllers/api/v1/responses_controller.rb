class Api::V1::ResponsesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @option = Option.find(params[:option_id])
    @responses = @option.responses
    render json: @responses
  end

  # def show
  #   @option = Option.find(params[:id])
  #   render json: @option
  # end
  #
  # def create
  #   body = request.body.read
  #   parsed = JSON.parse(body)
  #   option = Option.new(parsed)
  #   if option.save
  #     render json: { message: "It worked!" }
  #   else
  #     render json: { message: option.errors.full_messages }
  #   end
  # end
end
