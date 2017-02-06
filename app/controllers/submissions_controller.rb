class SubmissionsController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@submission = @question.submissions.create(submission_params)
		@user = current_user
		@score = current_user.score

		if @question.correct?(@submission.answer)
			@user.give_reward(@question.rewardpoint.to_i)
			redirect_to root_path
			flash[:notice] = "Accept!!"
		else
			@user.give_punish(@question.punishpoint.to_i) 
			redirect_to root_path
			flash[:alert] = "Wrong answer!!"
		end 
	end


	private
	def submission_params
	 	params.require(:submission).permit(:answer)
	end 
end
