class ParaphrasesController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  def index
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @themes = Theme.includes(:user).order("created_at DESC").page(params[:page]).per(4)
  end

  def new
    @themes = Theme.order("RAND()").limit(1)
    @paraphrase = @themes[0].paraphrases.new
  end

  def create
    @paraphrase = Paraphrase.new(sentence_params)
    if @paraphrase.save
    else
      redirect_to root_path
    end
  end

  def show
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @themes = Theme.order("RAND()").limit(1)
    @comment = Comment.new
    @comments = @paraphrase.comments.includes(:user)
  end

  private
  def sentence_params
    params.require(:paraphrase).permit(
      :answer,
      :theme_id,
      ).merge(user_id: current_user.id)
  end

  def set_tweet
    @paraphrase = Paraphrase.find(params[:id])
  end

end
