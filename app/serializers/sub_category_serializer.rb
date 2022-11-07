class SubCategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :logo

  def logo
    rails_blob_path(object.logo) if object.logo.attachment
  end
end
