class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to :back
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :message)
  end
end
