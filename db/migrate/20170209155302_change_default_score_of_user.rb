class ChangeDefaultScoreOfUser < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :score, :integer, :default => 0
  end
end
