class UsersController < ApplicationController
  def mypage
     @user = current_user
     @posts=@user.posts
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
  end
end
