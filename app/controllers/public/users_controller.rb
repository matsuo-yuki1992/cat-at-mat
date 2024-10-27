class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def mypage
     @user = current_user
     @posts = @user.posts
  end

  def show
    @user = User.find(params[:id])
    @groups = @user.groups
  end
end
