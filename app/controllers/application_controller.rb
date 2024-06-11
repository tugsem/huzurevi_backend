class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authenticate_user
  private

  def current_user #memoization
    @user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user #authorization_method
    render json: { error: "Not authorized"}, status: :unauthorized unless current_user
  end

end
