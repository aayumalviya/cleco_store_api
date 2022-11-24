class AddUserIdToDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    add_column :delivery_addresses, :user_id, :integer
  end
end
