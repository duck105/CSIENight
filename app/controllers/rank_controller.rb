class RankController < ApplicationController
  def index
    @users = User.order(:score => :desc, :name => :asc).limit(30)
  end
end
