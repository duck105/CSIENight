class Judge < ApplicationRecord
	belongs_to :question, foreign_key: :question_id
	belongs_to :user, foreign_key: :user_id

	def empty?(qid, uid)
  	if self != nil
  	else
  		self.new
  		self.question_id = qid
  		self.user_id = uid
  		self.state = 0
  		self.save 
  	end
  end

	def update(state_code)
		self.state = state_code
		self.save
	end

	def solve_problem?
   	self.state == 1
  end

  
end
