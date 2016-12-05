class ChangeColumnToEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :emails, :user_id, :unique => true, :name => 'ui_emails_01'
    add_index :emails, :email, :unique => true, :name => 'ui_emails_02'
  end
end
