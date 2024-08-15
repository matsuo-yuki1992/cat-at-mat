class UsersController < ApplicationController
  def mypage
  end

  def show
    @user=User.find(params[:id])
  end

  def edit
  end
end
