class CommentsController < ApplicationController
	before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  def destroy
  @comment = book.comments.find(params[:id])
  @comment.destroy
  redirect_back(fallback_location: root_path)
end 

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

 
