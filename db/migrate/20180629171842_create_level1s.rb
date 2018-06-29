class CreateLevel1s < ActiveRecord::Migration[5.2]
  def change
    create_table :level1s do |t|
      t.string :stage
      t.string :input
      t.integer :result

      t.timestamps
    end
  end
end
