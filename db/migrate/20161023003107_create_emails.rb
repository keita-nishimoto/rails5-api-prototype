class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails, unsigned: true do |t|
      t.unsigned_integer :user_id, null: false
      t.string :email, null: false
      t.boolean :email_verified, null: false, default: 0

      t.unsigned_integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
