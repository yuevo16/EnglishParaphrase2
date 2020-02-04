class ThemesController < ApplicationController
  def new
    @theme = Theme.new
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
