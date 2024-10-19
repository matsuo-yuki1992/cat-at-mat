class Public::UserAndGroupsController < ApplicationController
  def create
    group_user = current_user.user_and_group.new(group_id: params[:group_id])
    group_user.save
    redirect_to groups_path
  end
  
  def destroy
    group_user = current_user.user_and_group.find_by(group_id: params[:group_id])
    group_user.destroy
    redirect_to groups_path
  end
end
