class Product < ApplicationRecord
    has_one_attached :image
    after_create :old_price_count
    after_create :exclusive_price_count
    belongs_to :category
    belongs_to :sub_category

    has_many :product_sales, dependent: :destroy
    has_many :sales, through: :product_sales, dependent: :destroy

    attr_accessor :sale
    
    validates :title, presence: { message: "Title Can't be blank" }

    # validates :title, presence: { message: "Please add title" }
    validates :category_id, presence: { message: "Category can't be blank" }
    validates :sub_category_id, presence: { message: "SubCategory can't be blank" }

    def old_price_count
        percent  = 15
        product = self
        result = price * percent / 100
        old_price = price + result
        product.update(old_price: old_price)
    end

    def exclusive_price_count
        percent  = 10
        product = self
        result = price * percent / 100
        exclusive_price = price - result
        product.update(exclusive_price: exclusive_price)
    end
end