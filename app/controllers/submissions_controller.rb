class SubmissionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @submission = @question.submissions.create(submission_params)
    @user = current_user
    @submission.user = @user
    @score = current_user.score
    @judge = Judge.where("question_id = ? AND user_id = ?", params[:question_id], @user.id).take

    if @question.correct?(@submission.answer)
      if @judge.nil?
        @judge = Judge.new(question_id: @question.id, user_id: @user.id, state: 0)
      end

      if @judge.ever_solve_problem?
        flash[:notice] = "Accept!!But you have already answered it"
        @submission.state = "answered"
      else
        @user.give_reward(@question.rewardpoint.to_i)
        @judge.update(1)
        flash[:notice] = "Accept!!"
        @submission.state = "AC"
      end

    else
      if @judge.nil?
        @judge = Judge.new(question_id: @question.id, user_id: @user.id, state: 0)
      end
      if @judge.ever_solve_problem?
        flash[:notice] = "Wrong answer!!But you have already answered"
        @submission.state = "answered"
      else
        @user.give_punish(@question.punishpoint.to_i)
        @judge.update(2)
        flash[:alert] = "Wrong answer!!"
        @submission.state = "WA"
      end
    end
    @submission.save
    
    redirect_to edit_user_registration_path
  end


  private
  def submission_params
    params.require(:submission).permit(:answer)
  end
end
