class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create, :show]

  def index
    users = User.all
    render json: users
  end

  def show
    if current_user
      render json: current_user, status: :ok
    else
      render "No current session stored", status: :unauthorized
    end
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id # logs user in
      render json: user, status: :created
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def user_params
    params.permit(:username, :password)
  end
end
