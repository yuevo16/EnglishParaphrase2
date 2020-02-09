class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to themes_path
    # redirect_to themes_paraphrase_path(:paraphrase_id)
    # respond_to do |format|
    #   format.html { redirect_to paraphrase_path(params[:paraphrase_id])  }
    # #   format.json
    # end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, paraphrase_id: params[:paraphrase_id])
  end
end
