class Addquestionslug < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.string :slug 
    end
  end
end
