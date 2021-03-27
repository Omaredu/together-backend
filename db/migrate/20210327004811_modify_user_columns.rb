class ModifyUserColumns < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :status, :integer, null: false, default: 0
    add_column :users, :name, :string, null: true
  end
end
