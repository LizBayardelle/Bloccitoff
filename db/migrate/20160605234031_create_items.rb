class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :days_til_expire
      t.string :delegate_to
      t.string :user_id, null: false
      t.index :user_id, unique: true
      t.string :list_id, null: false
      t.index :list_id, unique: true
      t.timestamps null: false
    end
  end
end
