class EditSubmission < ActiveRecord::Migration[5.0]
  def change
  	add_column :submissions, :answer, :string
  end
end
