class AddUserRefToSubmission < ActiveRecord::Migration[5.0]
  def change
  	add_reference :submissions, :user, foreign_key: true
  end
end
