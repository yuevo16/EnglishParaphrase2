class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to themes_path
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, paraphrase_id: params[:paraphrase_id])
  end
end
