class Coupon < ApplicationRecord
	has_many :coupon_redemptions
	has_many :users, through: :coupon_redemptions
end
