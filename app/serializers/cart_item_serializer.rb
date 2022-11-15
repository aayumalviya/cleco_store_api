class CartItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :quantity, :product_id, :user_id
  belongs_to :user, serializer: UserSerializer
  belongs_to :product, serializer: ProductSerializer
end
