class CreateTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :tokens do |t|
      t.string :answer
      t.integer :rewardpoint

      t.timestamps
    end
  end
end
