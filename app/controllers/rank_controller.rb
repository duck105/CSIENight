class RankController < ApplicationController
	def index
		@users = User.order(:score => :desc, :email => :asc).limit(20)
	end
end
