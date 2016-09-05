class CreateLogin < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :user
      t.string :password_digest
    end
  end
end
