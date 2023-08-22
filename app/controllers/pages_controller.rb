class PagesController < ApplicationController
  before_action :authenticate_user!, only: :profile

  def home
  end

  def profile
    @user = User.find(current_user.id)
  end
end
