class ChangeColumnToName < ActiveRecord::Migration[5.0]
  def change

    add_index :names, :user_id, :unique => true, :name => 'ui_names_01'
  end
end
