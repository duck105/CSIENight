class AddQuestionRefToSubmission < ActiveRecord::Migration[5.0]
  def change
  	add_reference :submissions, :question, foreign_key: true
  end
end
