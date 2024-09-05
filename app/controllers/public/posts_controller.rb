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
    user = User.find(params[:id])
      unless user.id == current_user.id
      redirect_to posts_path
      end
    
    @post=Post.find(params[:id])
     @genres = Genre.all
  end
  
  def update
    @post = Post.find(params[:id])
    @genres = Genre.all.to_a
    if@post.update(post_params)
    redirect_to post_path
    else
      render :edit
    end
  end
  
  def create
    @post_new=Post.new(post_params)
    @post_new.user_id = current_user.id
    @genres = Genre.all.to_a
    if@post_new.save
    redirect_to posts_path
    else
      render :new
    end
  end
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    redirect_to mypage_users_path(current_user.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:body,:genre_id)
  end
end
