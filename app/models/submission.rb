class Submission < ApplicationRecord
  belongs_to :question, foreign_key: :question_id
  belongs_to :user, foreign_key: :user_id
end
