class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.create
    if @user.save
      redirect_to users_path, notice: "A user was successfully created."
    else
      render users_path, status: :unprocessable_entity, alert: "There was an error, try again."
    end
  end
end
