class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.integer :level
      t.integer :stage
      t.integer :result

      t.timestamps
    end
  end
end
