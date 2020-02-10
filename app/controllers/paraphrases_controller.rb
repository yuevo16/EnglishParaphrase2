class ParaphrasesController < ApplicationController
  def index
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @theme = Theme.includes(:user).order("created_at DESC").page(params[:page]).per(4)
  end

  def new
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @themes = Theme.order("RAND()").limit(1)
    @paraphrase = @themes[0].paraphrases.new
  end

  def add
    if user_signed_in?
      user = User.find(current_user[:id])
      @nickname = user.nickname
    end
    @theme = Theme.find(params[:id])
    @paraphrase = Paraphrase.new
  end

  def create
    if user_signed_in?
      @paraphrase = Paraphrase.new(sentence_params)
      @theme = Theme.find(@paraphrase[:theme_id])
      if @paraphrase.save
      else
        redirect_to root_path
      end
    else
      redirect_to new_user_registration_path
    end
    images = ["savanna.jpg", "sunset.jpg", "water_house.jpg", "car_road.jpg", "forest_road.jpg", "lake.jpg", "ocean.jpg", "rail_road.jpg"]
    @image = images.sample    
  end

  private
  def sentence_params
    params.require(:paraphrase).permit(
      :answer,
      :theme_id,
      :paraphrase_id
      ).merge(user_id: current_user.id)
  end

end
