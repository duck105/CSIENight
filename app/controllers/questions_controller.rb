class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end
  def show
    @question = Question.find(params[:id])
    @submission = Submission.new
  end


  private
  def question_params
    params.require(:question).permit(:title, :spec, :answer, :rewardpoint, :punishpoint, :category_id)
  end

end
