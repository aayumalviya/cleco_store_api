class OrderSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :user_id, :total_amount
  has_many :products, each_serializer: ProductSerializer
end
