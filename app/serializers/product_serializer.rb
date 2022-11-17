class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

    attributes :id, :title, :product_description, :price, :old_price, :exclusive_price, :thumbnail, :product_details, :is_published, :recommondation, :options, :quantity
  
    belongs_to :category, serializer: CategorySerializer
    belongs_to :sub_category, serializer: SubCategorySerializer
    has_many :product_media_files, each_serializer: ProductMediaFileSerializer

    def thumbnail
      #url_for(object.image) if object&.image&.attachment
      "https://i.pinimg.com/originals/a3/6b/42/a36b422bb2bebcbd77bba846b83ddf5d.png"
    end

    def recommondation
      array = []
      object.recommended_products.each do |product|
        array << {
          id: product.id,
          title: product.title ,
          product_description: product.product_description ,
          price: product.price ,
          old_price: product.old_price,
          exclusive_price: product.exclusive_price,
          # thumbnail: object&.image&.attached? ? url_for(object.image) : nil,
          thumbnail: "https://i.pinimg.com/originals/a3/6b/42/a36b422bb2bebcbd77bba846b83ddf5d.png",
          product_details: product.product_details ,
          is_published: product.is_published,
          category: ActiveModelSerializers::SerializableResource.new(product.category, serializer: CategorySerializer),
          sub_category: ActiveModelSerializers::SerializableResource.new(product.sub_category, serializer: SubCategorySerializer)
        }
      end
      array
    end

    def options
      object.options.pluck(:short_name)
    end

    def quantity
      object.quantity.to_i
    end
end
  