class QuestionsController < ApplicationController
	def index
		@questions = Question.all
	end
	def show
		@question = Question.find(params[:id])
	end
	def new
		@question = Question.new
	end
	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to root_path
		else
			render 'new'
		end
	end
	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to root_path
		flash[:alert] = "post was successfully destroyed"
	end


	private
	def question_params
		params.require(:question).permit(:title, :spec, :answer, :rewardpoint, :punishpoint)
	end

end
