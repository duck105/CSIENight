class Judge < ApplicationRecord
  belongs_to :question, foreign_key: :question_id
  belongs_to :user, foreign_key: :user_id

  def update(state_code)
    self.state = state_code
    self.save
  end

  def ever_solve_problem?
    self.state == 1
  end
end
