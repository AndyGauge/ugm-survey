class CreateAnswers < ActiveRecord::Migration
  def change
  	create_table :answers do |t|
      t.references :question
      t.references :survey
      t.integer    :value
      t.text       :comments
    end
  end
end
