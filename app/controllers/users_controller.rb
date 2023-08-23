class UsersController < ApplicationController
  def index
    @users = User.all
    if params.present? && params[:user].present?
      @users = User.where(user_params)
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:location, :age, :event, :gender, :start_date)
  end
end
