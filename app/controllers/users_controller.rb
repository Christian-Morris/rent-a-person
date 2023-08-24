class UsersController < ApplicationController
  def index
    @users = UserOccasion.where(occasion: Occasion.find_by(name: params[:user][:occasion])).map {|o| o.user}
    age_range = params[:user][:age].split("-")
    if age_range[1].to_i.positive?
      @users = User.where(age: age_range[0].to_i..age_range[1].to_i)
      @users = @users.select { |u| u.age >= age_range[0].to_i }
      @users = @users.select { |u| u.age <= age_range[1].to_i }
    else
      @users = @users.select { |u| u.age >= age_range[0].to_i }
    end
    @users = @users.select { |u| u.location == params[:user][:location] }
    @users = @users.select { |u| u.gender == params[:user][:gender] }

    if @users == []
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:location, :age, :event, :gender, :start_date)
  end
end
