class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, unsigned: true do |t|

      t.unsigned_integer :gender, null: false, default: 0
      t.date :birthdate, null: false

      t.unsigned_integer :lock_version, null: false, default: 0
      t.timestamps
    end
  end
end
