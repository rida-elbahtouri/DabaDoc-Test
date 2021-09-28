class AnswersController < ApplicationController
  before_action :process_token

  # POST /answers
  def create
    @answer = current_user.answers.new(answer_params)

    if @answer.save
      render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end
