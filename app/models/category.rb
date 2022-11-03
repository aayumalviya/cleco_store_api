class Category < ApplicationRecord
    has_many :sub_categories, dependent: :destroy
    has_many :categories, dependent: :destroy
end
