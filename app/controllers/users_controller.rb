class UsersController < ApplicationController
  def index
    @users = User.all
    if params.present?
      @users = User.where(params[:id])
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
