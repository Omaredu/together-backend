class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :verified, null: false, default: false

      t.timestamps
    end
  end
end
