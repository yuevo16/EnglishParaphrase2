class ParaphrasesController < ApplicationController
  def index
  end

  def new
    @paraphrase = Paraphrase.new
    @theme = Theme.All
  end

  def create
    @paraphrase = Paraphrase.new(sentence_params)
    if @paraphrase.save
    else
      redirect_to root_path
    end
  end

  private
  def sentence_params
    params.require(:paraphrase).permit(
      :answer
      ).merge(user_id: current_user.id)
  end
end
