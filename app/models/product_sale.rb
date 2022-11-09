class ProductSale < ApplicationRecord
    belongs_to :product
    belongs_to :sale

    validates :product_id, uniqueness: { scope: [:sale_id] }
end
