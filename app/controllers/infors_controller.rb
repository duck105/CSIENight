class InforsController < ApplicationController
	def index
		@infors = Infor.all
	end
end
		
