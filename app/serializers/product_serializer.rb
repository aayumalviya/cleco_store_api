class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

    attributes :id, :title, :product_description, :price, :old_price, :exclusive_price, :thumbnail, :product_details, :is_published, :recommondation, :options, :quantity
  
    belongs_to :category, serializer: CategorySerializer
    belongs_to :sub_category, serializer: SubCategorySerializer
    has_many :product_media_files, each_serializer: ProductMediaFileSerializer

    def thumbnail
      #url_for(object.image) if object&.image&.attachment
      "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1665405926_6980127.jpg?format=webp&w=480&dpr=1.0"
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
          thumbnail: "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1665405926_6980127.jpg?format=webp&w=480&dpr=1.0",
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
  