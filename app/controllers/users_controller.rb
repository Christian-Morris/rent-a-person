class UsersController < ApplicationController
  def index
    if params.present? && params[:user].present?
      @users = User.where(user_params)
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  # def search

  #   @users = User.all

  #   if params[:location].present?
  #     @users = @users.where(location: params[:location])
  #   end

  #   if params[:age].present?
  #     @users = @users.where(age: params[:age])
  #   end

  #   if params[:occasion].present?
  #     @users = @users.joins(:occasions).where('occasions.name' => params[:occasion])
  #   end

  #   if params[:gender].present?
  #     @users = @users.where(gender: params[:gender])
  #   end

  #   if params[:start_date].present?
  #     @users = @users.where('start_date >= ?', params[:start_date])
  #   end

  #   render 'index'
  # end

  def user_params
    params.require(:user).permit(:location, :age, :event, :gender, :start_date)
  end
end
