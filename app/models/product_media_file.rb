class ProductMediaFile < ApplicationRecord
  has_many_attached :images
  belongs_to :product
end
