class ErrorsController < ApplicationController
  def invalid_route
    render json: {
      error: "the end point #{params[:url]} is not available"
    }, status: 400
  end
end
