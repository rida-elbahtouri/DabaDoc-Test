class QuestionsController < ApplicationController
  before_action :process_token

  # GET /questions
  def index
    @questions = if params[:lat].present? && params[:long].present?

                   Question.near([params[:lat], params[:long]], 50, order: :distance)
                 else
                   Question.all
                 end
    render json: @questions
  end

  # POST /questions
  def create
    @question = current_user.questions.new(question_params)

    if @question.save
      render json: @question, status: :created, location: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    @question = current_user.questions.find(params[:id])
    if @question.update(question_params)
      render json: @question
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy
  end

  private

  # Only allow a trusted parameter "white list" through.
  def question_params
    params.require(:question).permit(:title, :content, :latitude, :longitude)
  end
end
