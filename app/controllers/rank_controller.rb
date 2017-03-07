class RankController < ApplicationController
  def index
    @users = User.order("score DESC", "updated_at ASC").limit(30)
  end
end
