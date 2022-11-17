class Sale < ApplicationRecord
    has_many :product_sales, dependent: :destroy
    has_many :products, through: :product_sales, dependent: :destroy

    #default_scope { where(is_active: true) }
    scope :active, -> { where(is_active: true) }

end
