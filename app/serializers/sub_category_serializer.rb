class SubCategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :logo

  def logo
    #url_for(object.logo) if object&.logo&.attachment
    "https://prod-img.thesouledstore.com/public/theSoul/uploads/catalog/product/1665405926_6980127.jpg?format=webp&w=480&dpr=1.0"
  end
end
