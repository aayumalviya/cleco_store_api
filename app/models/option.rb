class Option < ApplicationRecord
  has_many :product_options, dependent: :destroy
  has_many :products, through: :product_options,  dependent: :destroy
end
