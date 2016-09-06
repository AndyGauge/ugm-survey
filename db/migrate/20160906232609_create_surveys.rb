class CreateSurveys < ActiveRecord::Migration
  def change
  	create_table :surveys do |t|
      t.references :client
      t.references :staff
      t.timestamps
    end
  end
end
