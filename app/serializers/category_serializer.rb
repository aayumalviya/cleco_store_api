class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :logo

  has_many :sub_categories, serializer: SubCategorySerializer

  def logo
    url_for(object.logo) if object.logo.attachment
  end
end
