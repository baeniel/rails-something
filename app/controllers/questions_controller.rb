class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @questions = current_user&.questions
  end

  def new
  end

  def create
    question = Question.new(question_params)
    question.user_id = current_user.id
    question.save
    redirect_to root_path
  end

  private
  def question_params
    params.require(:question).permit(:title)
  end
end
