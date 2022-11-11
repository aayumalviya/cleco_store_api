class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

    attributes :id, :title, :product_description, :price, :old_price, :exclusive_price, :thumbnail, :product_details, :is_published, :recommondation, :images
  
    belongs_to :category, serializer: CategorySerializer
    belongs_to :sub_category, serializer: SubCategorySerializer
    has_many :product_media_files, each_serializer: ProductMediaFileSerializer

    def thumbnail
       url_for(object.image) if object&.image&.attachment
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
          thumbnail: object&.image&.attached? ? url_for(object.image) : nil,
          product_details: product.product_details ,
          is_published: product.is_published
        }
      end
      array
    end

    def images
      #object.product_media_files.each do  |product_media_file|
        #url_for(product_media_file.image) if product_media_file&.image&.attached?
      #end
    end

end
  