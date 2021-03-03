class CommentsController < ApplicationController
  def create
     @memory = Memory.find(params[:memory_id])
     @comment = @memory.comments.build(comment_params)
     @comment = Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html { redirect_to memory_path(@memory)}
        format.json
      end
    else
      render memory_path(@memory.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, memory_id: params[:memory_id])
  end
end
