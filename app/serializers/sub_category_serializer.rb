class SubCategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :logo

  def logo
    #url_for(object.logo) if object&.logo&.attachment
    "https://i.pinimg.com/originals/a3/6b/42/a36b422bb2bebcbd77bba846b83ddf5d.png"
  end
end
