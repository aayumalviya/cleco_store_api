class Api::BaseController < ApplicationController

  protect_from_forgery with: :null_session
  # acts_as_token_authentication_handler_for User

  def find_current_user
    email = request.headers['X-User-Email']
    token = request.headers['X-User-Token']
    @current_user = User.find_by(email: email, authentication_token: token)
    unless @current_user.present?
      render json: { messages: 'You are not authorized', is_success: false, data: {} }, status: :unauthorized
    end
  end

  def success_json
    render json: {
      data:'Ok',
      message: 'success',
      status: 200,
      type: 'Success'
    }
  end

  def method_name
    render json: {
      data: 'not_working',
      message: bus_trip.errors.full_messages.to_sentence,
      status: 422,
      type: 'Unprocessable Entity'
    }
  end

end
