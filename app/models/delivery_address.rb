class DeliveryAddress < ApplicationRecord
  validates :address, uniqueness: { scope: [:user_id] }
  validates :name, :pincode, :locality, :address, :city, :state, :landmark, :alternate_phone, :address_type, presence: true
  validates :mobile_number, presence: true,
                    :length => { :minimum => 10, :maximum => 13}
  belongs_to :user
end
