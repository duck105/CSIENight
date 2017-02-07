class CreateJudges < ActiveRecord::Migration[5.0]
  def change
    create_table :judges do |t|
      t.integer :state

      t.timestamps
    end
  end
end
