class ThemesController < ApplicationController
  def new
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @theme = Theme.new
    @themes = Theme.order("RAND()").limit(1)
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to paraphrases_path
    else
      redirect_to root_path
    end
  end

  private
    def theme_params
      params.require(:theme).permit(
        :question
        ).merge(user_id: current_user.id)
    end


end
