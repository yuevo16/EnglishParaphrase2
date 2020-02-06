class UsersController < ApplicationController
  def index
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @themes = Theme.order("RAND()").limit(1)
  end

  def show
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @themes = Theme.order("RAND()").limit(1)
    @theme = user.themes.page(params[:page]).per(5).order("created_at DESC")
  end
end
