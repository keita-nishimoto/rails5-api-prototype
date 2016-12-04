class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|

      t.integer :gender, null: false, default: 0
      t.date :birthdate, null: false
      t.timestamps
    end
  end
end
