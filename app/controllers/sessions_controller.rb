class SessionsController < ApplicationController
  skip_before_action :authenticate_user
  def create#login
    #find the user using the params username
    #authenticate the user with the given password
    user = User.find_by_username(params[:username])
    if user&.authenticate(params[:password]) #method comes with has_secure_password
      session[:user_id] = user.id # logs user in, keep track of user
      render json: user, status: :ok
    else
      render "invalid credentials", status: :unauthorized
    end
  end

  def destroy#logout
    session.delete :user_id
    render "logged out", status: :ok
  end
end
