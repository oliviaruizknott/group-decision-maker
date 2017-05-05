class ResponsesController < ApplicationController
  def create
    @response = Response.new
  end
end
