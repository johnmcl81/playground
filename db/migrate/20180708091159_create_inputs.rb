class CreateInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :inputs do |t|
      t.integer :input
      t.integer :order
      t.integer :level
      t.timestamps
    end
  end
end
