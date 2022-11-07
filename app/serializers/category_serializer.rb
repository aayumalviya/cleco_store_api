class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :logo

  has_many :sub_categories, serializer: SubCategorySerializer
end
