class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.float :discount_amount
      t.datetime :expiration_date
      t.integer :total_redeem

      t.timestamps
    end
  end
end
