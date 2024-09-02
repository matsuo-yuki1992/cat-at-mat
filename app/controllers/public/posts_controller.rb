class Public::PostsController < ApplicationController
  def new
    @post_new = Post.new
    @genres = Genre.all
  end

  def index
    @posts = Post.all
    
    
  end

  def show
    @post=Post.find(params[:id])
    @user=@post.user
  end

  def edit
    @post=Post.find(params[:id])
     @genres = Genre.all
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path
  end
  
  def create
    @post_new=Post.new(post_params)
    @post_new.user_id = current_user.id
    @post_new.save!
    redirect_to posts_path
  end
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to user_mypage_path(current_user.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:body,:genre_id)
  end
end
