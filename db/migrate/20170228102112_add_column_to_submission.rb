class AddColumnToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :state, :string
  end
end
