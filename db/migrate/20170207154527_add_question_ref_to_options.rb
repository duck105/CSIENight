class AddQuestionRefToOptions < ActiveRecord::Migration[5.0]
  def change
  	add_reference :options, :question, foreign_key: true
  end
end
