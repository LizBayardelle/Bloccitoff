class ChangeCompletedToEnum < ActiveRecord::Migration
  def self.up
     change_table :items do |t|
       t.change :completed, :integer, default: 0
     end
   end
   def self.down
     change_table :items do |t|
       t.change :completed, :date
     end
   end
end
