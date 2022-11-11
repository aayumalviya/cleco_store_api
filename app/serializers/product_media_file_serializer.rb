class ProductMediaFileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :product_id, :image_url

  def image_url
    url_for(object.image) if object&.image&.attached?
  end
end