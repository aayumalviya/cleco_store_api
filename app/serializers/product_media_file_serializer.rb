class ProductMediaFileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :product_id, :image_url

  def image_url
    #url_for(object.image) if object&.image&.attached?
    "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1665405926_6980127.jpg?format=webp&w=480&dpr=1.0"
  end
end