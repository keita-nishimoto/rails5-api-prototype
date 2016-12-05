class ChangeColumnToPassword < ActiveRecord::Migration[5.0]
  def change

    add_index :passwords, :user_id, :unique => true, :name => 'ui_passwords_01'
  end
end
