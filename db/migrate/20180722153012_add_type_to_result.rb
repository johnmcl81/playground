class AddTypeToResult < ActiveRecord::Migration[5.2]
  def change
    add_column :results, :type, :string
    change_column :results, :type, :string, null: false
  end
end
