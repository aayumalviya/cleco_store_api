class Product < ApplicationRecord
  has_one_attached :image
  before_validation :set_calculated_values
  belongs_to :category
  belongs_to :sub_category
  has_many :product_options, dependent: :destroy
  has_many :options, through: :product_options, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products, dependent: :destroy
  has_many :product_sales, dependent: :destroy
  has_many :product_media_files, dependent: :destroy
  accepts_nested_attributes_for :product_media_files
  has_many :sales, through: :product_sales, dependent: :destroy
  has_many :notifications, as: :notifiable

  attr_accessor :sale
    
  validates :title, presence: { message: "Title Can't be blank" }

    # validates :title, presence: { message: "Please add title" }
  validates :category_id, presence: { message: "Category can't be blank" }
  validates :sub_category_id, presence: { message: "SubCategory can't be blank" }


  def recommended_products
    self.sub_category.products.where(is_recommended: true)
  end

  private

  def set_calculated_values
    old_price_calculation()
    exclusive_price_calculation()
    set_category_id()
  end

  def old_price_calculation
    result = price * 15 / 100
    old_price = price + result
    self.old_price = old_price
  end

  def exclusive_price_calculation
    result = price * 10 / 100
    exclusive_price = price - result
    self.exclusive_price = exclusive_price
  end

  def set_category_id
    self.category_id = self.sub_category.category_id
  end
end