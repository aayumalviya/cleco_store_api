class CreateDeliveryAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.string :name
      t.string :mobile_number
      t.integer :pincode
      t.string :locality
      t.string :address
      t.string :city
      t.string :state
      t.string :landmark
      t.string :alternate_phone
      t.string :address_type

      t.timestamps
    end
  end
end
