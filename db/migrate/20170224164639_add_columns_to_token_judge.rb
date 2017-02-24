class AddColumnsToTokenJudge < ActiveRecord::Migration[5.0]
  def change
    add_column :token_judges, :state, :boolean
    add_reference :token_judges, :user, foreign_key: true
    add_reference :token_judges, :token, foreign_key: true
  end
end
