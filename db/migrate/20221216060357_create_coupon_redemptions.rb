class CreateCouponRedemptions < ActiveRecord::Migration[6.1]
  def change
    create_table :coupon_redemptions do |t|
      t.integer :coupon_id
      t.integer :user_id

      t.timestamps
    end
  end
end
