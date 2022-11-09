class SubCategory < ApplicationRecord
    has_one_attached :logo

    belongs_to :category
    has_many :products, dependent: :destroy

    validates :name, presence: { message: "Title Can't be blank" }

end
