class Admin::PostsCommentController < ApplicationController
  def destroy
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    post = Post.find(params[:id])
    redirect_to admin_post_path(post)
  end
    
end
