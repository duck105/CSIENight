class SubmissionsController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@submission = @question.submissions.create(submission_params)

		if @question.correct?(@submission.answer)
			redirect_to root_path
			flash[:notice] = "Accept!!"
		else 
			redirect_to root_path
			flash[:alert] = "Wrong answer!!"
		end 
	end


	private
	def submission_params
	 	params.require(:submission).permit(:answer)
	end 
end
