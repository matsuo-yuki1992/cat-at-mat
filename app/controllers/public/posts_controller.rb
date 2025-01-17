class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_author!, only: [:edit, :update, :destroy]
  
  def new
    @post_new = Post.new
    @genres = Genre.all
  end

  def index
    @posts = Post.all
    if params[:title].present?
      @posts = Post.search_by_title(params[:title])
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    @post = Post.find(params[:id])
    @genres = Genre.all.to_a
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end
  
  def create
    @post_new = Post.new(post_params)
    @post_new.user_id = current_user.id
    @genres = Genre.all.to_a
    if @post_new.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to mypage_users_path(current_user.id)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :genre_id)
  end
  
  def authenticate_author!
    post = Post.find(params[:id])
    if post.user != current_user
      redirect_to posts_path
    end
  end
end
