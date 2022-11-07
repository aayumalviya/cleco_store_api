class Category < ApplicationRecord
    # has_one_attached :logo, dependent: :destroy
    has_many :sub_categories, dependent: :destroy
end
