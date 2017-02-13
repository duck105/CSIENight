module QuestionsHelper
	def new_or_not(question)
		return ((Time.now -  question.updated_at)/86400).to_i
	end
end
