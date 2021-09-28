class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[destroy]
  before_action :process_token
  # GET /favorites
  def index
    @favorites = current_user.favorite_questions

    render json: @favorites
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(user_id:current_user.id,question_id:favorite_params[:question_id])

    if @favorite.save
      render json: @favorite, status: :created, location: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def destroy
    @favorite.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def favorite_params
    params.require(:favorite).permit(:question_id, :user_id)
  end
end
