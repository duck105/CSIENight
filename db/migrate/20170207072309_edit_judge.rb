class EditJudge < ActiveRecord::Migration[5.0]
  def change
  	add_reference :judges, :user, foreign_key: true
  	add_reference :judges, :question, foreign_key: true
  end
end
