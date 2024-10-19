class Admin::GroupsController < AdminController
  def index
    @groups = Group.all
    @group_new = Group.new
  end
  
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to admin_groups_path, notice: 'グループを作成しました'
    else
      render :index
    end
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update(post_params)
      redirect_to admin_groups_path
    else
      render :edit
    end
  end
  
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to admin_groups_path
  end
  
  private
  def group_params
    params.require(:group).permit(:name)
  end
  
end
