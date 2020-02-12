class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    paraphrase = Paraphrase.find(params[:paraphrase_id])
    theme = paraphrase.theme_id
    redirect_to themes_paraphrase_path(theme)
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, paraphrase_id: params[:paraphrase_id])
  end
end
