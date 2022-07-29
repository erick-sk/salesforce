class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.order(dob_age: :desc)
  end

  def create
    @user = User.create
    if @user.save
      redirect_to users_path, notice: "A user was successfully created."
    else
      render users_path, status: :unprocessable_entity, alert: "There was an error, try again."
    end
  end

  def export
    @users = User.all

    respond_to do |format|
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end
end
