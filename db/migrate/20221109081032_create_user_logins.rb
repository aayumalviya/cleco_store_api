class CreateUserLogins < ActiveRecord::Migration[6.1]
  def change
    create_table :user_logins do |t|
      t.string :device_id
      t.string :ip_address
      t.integer :user_id

      t.timestamps
    end
  end
end
