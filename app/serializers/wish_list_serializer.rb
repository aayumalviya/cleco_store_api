class WishListSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :product_id
  belongs_to :user, serializer: UserSerializer
  belongs_to :product, serializer: ProductSerializer
end
