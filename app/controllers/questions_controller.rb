class QuestionsController < ApplicationController
	def index
		@questions = Question.all
	end
	def show
		@question = Question.find(params[:id])
	end


	private
	def question_params
		params.require(:question).permit(:title, :spec, :answer, :rewardpoint, :punishpoint, :category_id)
	end

end
