class RankController < ApplicationController
	def index
		@users = User.order(:score => :desc).limit(20)
	end
end
