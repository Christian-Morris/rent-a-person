class UsersController < ApplicationController
  def index
    @users = User.all
    unless params[:user][:occasion] == ""
      @users = UserOccasion.where(occasion: Occasion.find_by(name: params[:user][:occasion])).map {|o| o.user}
    end
    age_range = params[:user][:age].split("-")
    unless params[:user][:age] == ""
      if age_range[1].to_i.positive?
        @users = User.where(age: age_range[0].to_i..age_range[1].to_i)
        @users = @users.select { |u| u.age >= age_range[0].to_i }
        @users = @users.select { |u| u.age <= age_range[1].to_i }
      else
        @users = @users.select { |u| u.age >= age_range[0].to_i }
      end
    end
    unless params[:user][:location] == ""
      @users = @users.select { |u| u.location == params[:user][:location] }
    end
    unless params[:user][:gender] == ""
      @users = @users.select { |u| u.gender == params[:user][:gender] }
    end

    if @users == []
      flash.alert = 'No users match your search query => showing all users'
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
