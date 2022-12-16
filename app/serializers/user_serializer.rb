class UserSerializer < ActiveModel::Serializer
  has_many :delivery_addresses, serializer: DeliveryAddressesSerializer
  attributes :id, :first_name, :last_name, :email, :phone_number, :authentication_token
end