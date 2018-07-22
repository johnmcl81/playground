class AddTypeToInput < ActiveRecord::Migration[5.2]
  def change
    add_column :inputs, :type, :string
    change_column :inputs, :type, :string, null: false
  end
end
