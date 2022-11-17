class ProductMediaFileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :product_id, :image_url

  def image_url
    #url_for(object.image) if object&.image&.attached?
    "https://i.pinimg.com/originals/a3/6b/42/a36b422bb2bebcbd77bba846b83ddf5d.png"
  end
end