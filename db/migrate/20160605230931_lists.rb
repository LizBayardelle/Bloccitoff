class Lists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :description
      t.string :shared_with, array: true
    end
  end
end
