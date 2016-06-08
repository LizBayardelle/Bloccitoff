class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.date :completed
      t.string :name
      t.string :delegated_to
      t.integer :days_to_expiration
      t.integer :user_id
      t.integer :list_id

      t.timestamps null: false
    end
    add_index :items, :user_id
    add_index :items, :list_id
  end
end
