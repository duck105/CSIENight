class SubmissionsController < ApplicationController
	def create
		@question = Question.find(params[:question_id])
		@submission = @question.submissions.create(submission_params)
		@user = current_user
		@score = current_user.score
		@judge = Judge.where("question_id = ? AND user_id = ?", params[:question_id], @user.id).take
		@category = Category.find(@question.category_id)

		if @question.correct?(@submission.answer)
			if @judge.nil?
				@judge = Judge.new
				@judge.init(@question.id, @user.id,0)
			end
			if @judge.solve_problem?
				flash[:notice] = "Accept!!But you have already answered it"
				redirect_to category_path(@category)
			else
				@user.give_reward(@question.rewardpoint.to_i)
				@judge.update(1)
				flash[:notice] = "Accept!!"
				redirect_to category_path(@category)
			end
			
		else
			if @judge.nil?
				@judge = Judge.create
				@judge.init(@question.id, @user.id,0)
			end
			if @judge.solve_problem?
				flash[:notice] = "Wrong answer!!But you have already answered"
				redirect_to category_path(@category)
			else
				@user.give_punish(@question.punishpoint.to_i) 
				@judge.update(2)
				redirect_to category_path(@category)
				flash[:alert] = "Wrong answer!!"
			end
		end 
	end


	private
	def submission_params
	 	params.require(:submission).permit(:answer)
	end 
end
