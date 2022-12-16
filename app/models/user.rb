class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_logins, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :delivery_addresses, dependent: :destroy
  has_many :wish_lists, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many :coupon_redemptions
  has_many :coupons, through: :coupon_redemptions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
