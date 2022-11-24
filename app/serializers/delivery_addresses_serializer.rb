class DeliveryAddressesSerializer < ActiveModel::Serializer
  attributes :id, :name, :mobile_number, :pincode, :locality, :address, :city, :state, :landmark, :alternate_phone, :address_type, :user_id
end
