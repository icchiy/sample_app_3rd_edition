class CommentsController < ApplicationController

  def new
    @comment = Comment.new
    @micropost = Micropost.find(params[:micropost_id])
  end

  def create
    @comment = Comment.create(micropost_id: comment_params[:micropost_id], comment: comment_params[:comment], user_id: current_user.id)
    redirect_to root_path
  end
  
  private
  def comment_params
    params.permit(:micropost_id, :user_id, :comment)
  end
end
