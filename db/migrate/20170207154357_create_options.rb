class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.text :body

      t.timestamps
    end
  end
end
