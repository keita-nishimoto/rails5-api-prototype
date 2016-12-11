class CreatePasswords < ActiveRecord::Migration[5.0]
  def change
    create_table :passwords, unsigned: true do |t|

      t.unsigned_integer :user_id, null: false
      t.string :password_hash, null: false

      t.unsigned_integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
