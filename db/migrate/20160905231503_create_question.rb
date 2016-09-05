class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :question do |t|
      t.string :text
    end
  end
end
