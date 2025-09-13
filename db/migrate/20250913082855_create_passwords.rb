class CreatePasswords < ActiveRecord::Migration[8.0]
  def change
    create_table :passwords do |t|
      t.string :user_id
      t.string :password
      t.string :website_url
      t.string :website_name

      t.timestamps
    end
  end
end
