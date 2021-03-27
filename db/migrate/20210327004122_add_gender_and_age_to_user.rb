class AddGenderAndAgeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :integer, null: true
    add_column :users, :age, :integer, null: true
  end
end
