class CreateNames < ActiveRecord::Migration[5.0]
  def change
    create_table :names, unsigned: true do |t|

      t.unsigned_integer :user_id, null: false
      t.string :given_name, null: false
      t.string :family_name, null: false
      t.string :nickname, null: false
      t.string :preferred_username, null: false

      t.unsigned_integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
