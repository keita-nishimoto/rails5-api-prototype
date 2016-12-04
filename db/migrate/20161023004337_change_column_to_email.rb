class ChangeColumnToEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :emails, :user_id, :unique => true
    add_index :emails, :email, :unique => true
  end
end
