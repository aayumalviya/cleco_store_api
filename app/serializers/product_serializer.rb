class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

    attributes :id, :title, :product_description, :price, :old_price, :exclusive_price, :image, :product_details, :is_published
  
    belongs_to :category, serializer: CategorySerializer
    belongs_to :sub_category, serializer: SubCategorySerializer
    # has_many :sub_categories, serializer: SubCategorySerializer

    def image
      url_for(object.image) if object&.image&.attachment
    end
  end
  