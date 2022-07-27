class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.create
    if @user.save
      redirect_to users_path, notice: "User created"
    else
      redirect_to new_user_path, status: :unprocessable_entity
    end
  end
end
