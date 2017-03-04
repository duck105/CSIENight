class TokensController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def result
    token = Token.where("answer = ?", params[:search]).take
    if token
      token_judge = TokenJudge.where("token_id = ? AND user_id = ?", token.id, current_user.id).take
      if token_judge.nil?
        token_judge = TokenJudge.new(token_id: token.id, user_id: current_user.id, state: "false")
      end
      if token_judge.state == true
        flash[:notice] = "Accept!!But you have already submitted this token"
        token_judge.save
      else
        current_user.give_reward(token.rewardpoint.to_i)
        flash[:notice] = "Accept!!You have got #{token.rewardpoint.to_i} points!"
        token_judge.state = true
        token_judge.save
      end
      redirect_to tokens_path
    else
      redirect_to tokens_path
      flash[:notice] = "Token not found!!"
    end
  end

end
