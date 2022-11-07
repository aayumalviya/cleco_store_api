class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

    attributes :id, :title, :product_description, :price, :old_price, :exclusive_price, :image, :product_details, :category_id, :is_published ,  :sub_category_id
  
    # has_many :sub_categories, serializer: SubCategorySerializer

    def image
      rails_blob_path(object.image) if object.image.attachment
    end
  end
  