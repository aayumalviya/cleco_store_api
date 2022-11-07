class SubCategory < ApplicationRecord
    has_one_attached :logo

    belongs_to :category
    has_many :products, dependent: :destroy
end
