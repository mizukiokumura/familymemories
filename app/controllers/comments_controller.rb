class CommentsController < ApplicationController
  def create
    if @comment = Comment.create(comment_params)
      redirect_to memory_path(@comment.memory.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, memory_id: params[:memory_id])
  end
end
