class PostsController < ApplicationController
  def new
    @post_new=Post.new
  end

  def index
    @posts=Post.all
    
    
  end

  def show
    @post=Post.find(params[:id])
  end

  def edit
  end
  
  def create
    @post_new=Post.new(post_params)
    @post_new.save
    @post_new.user_id = current_user.id
    redirect_to posts_path
  end
  
  
  private
  
  def post_params
    params.require(:post).permit(:title,:body)
  end
end
