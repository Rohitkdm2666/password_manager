class AddUsernameToPasswords < ActiveRecord::Migration[8.0]
  def change
    add_column :passwords, :username, :string
  end
end
