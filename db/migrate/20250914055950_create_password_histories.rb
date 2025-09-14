class CreatePasswordHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :password_histories do |t|
      t.string :password_id
      t.string :old_password
      t.string :new_password

      t.timestamps
    end
  end
end
