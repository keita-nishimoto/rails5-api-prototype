class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.integer :user_id, null: false
      t.string :email, null: false
      t.boolean :email_verified, null: false, default: 0

      t.timestamps
    end
  end
end
