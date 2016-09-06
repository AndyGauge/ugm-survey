class CreatePeople < ActiveRecord::Migration
  def change
  	create_table :people do |t|
      t.string :name
      t.column :role, :integer, default: 0
    end
  end
end
