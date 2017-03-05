class AddColumnsToQuestion < ActiveRecord::Migration[5.0]
  def change
  	add_column :questions, :title, :string
  	add_column :questions, :spec, :text
  	add_column :questions, :answer, :string
  	add_column :questions, :rewardpoint, :integer
  	add_column :questions, :punishpoint, :integer 
  end
end
