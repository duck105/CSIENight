class Submission < ApplicationRecord
	belongs_to :question, foreign_key: :question_id
end
