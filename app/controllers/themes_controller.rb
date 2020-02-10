class ThemesController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  def index
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @themes = Theme.order("RAND()").limit(1)
    @theme = Theme.includes(:user).order("created_at DESC").page(params[:page]).per(3)
  end
  
  def new
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    else
      redirect_to new_user_registration_path
    end
    @theme = Theme.new
    @themes = Theme.order("RAND()").limit(1)
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to themes_path
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
  
  def destroy
    theme = Theme.find(params[:id])
    theme.destroy
    redirect_to user_path(current_user.id)
  end


  private
    def theme_params
      params.require(:theme).permit(
        :question
        ).merge(user_id: current_user.id)
    end

    def set_tweet
      @paraphrase = Paraphrase.find(params[:id])
    end


end
