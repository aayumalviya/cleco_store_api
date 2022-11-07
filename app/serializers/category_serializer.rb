class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :logo

  has_many :sub_categories, serializer: SubCategorySerializer

  def logo
    rails_blob_path(object.logo) if object.logo.attachment
  end
end
