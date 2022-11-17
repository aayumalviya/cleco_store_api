class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :logo

  has_many :sub_categories, serializer: SubCategorySerializer

  def logo
    #url_for(object&.logo) if object&.logo&.attachment
    "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1665405926_6980127.jpg?format=webp&w=480&dpr=1.0"
  end
end
