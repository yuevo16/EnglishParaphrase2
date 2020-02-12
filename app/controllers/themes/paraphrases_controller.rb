class Themes::ParaphrasesController < ApplicationController
  before_action :set_theme, only: [:show]

  def show
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @themes = Theme.order("RAND()").limit(1)
    @theme = Theme.find(params[:id])
    @comment = Comment.new
    @comments = @paraphrase.comments.includes(:user).order("created_at DESC").page(params[:page]).per(12)
  end

  def set_theme
    theme = Theme.find(params[:id])
    @paraphrase = theme.paraphrases[0]
  end

end
