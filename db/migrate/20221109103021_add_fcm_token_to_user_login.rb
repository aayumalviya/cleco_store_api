class AddFcmTokenToUserLogin < ActiveRecord::Migration[6.1]
  def change
    add_column :user_logins, :fcm_token, :string
  end
end
