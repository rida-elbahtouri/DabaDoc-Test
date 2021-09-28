class FavoritesController < ApplicationController
  before_action :process_token
  # GET /favorites
  def index
    @favorites = current_user.favorite_questions

    render json: @favorites
  end

  # POST /favorites
  def create
    @favorite = Favorite.new(user_id: current_user.id, question_id: favorite_params[:question_id])

    if @favorite.save
      render json: @favorite, status: :created, location: @favorite
    else
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorites/1
  def delete_from_fav
    @favorite = current_user.favorites.find_by(question_id: params[:question_id])
    @favorite.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def favorite_params
    params.require(:favorite).permit(:question_id)
  end
end
