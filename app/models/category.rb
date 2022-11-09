class Category < ApplicationRecord
    include Rails.application.routes.url_helpers
    has_one_attached :logo
    has_many :sub_categories, dependent: :destroy

    validates :name, presence: { message: "Name Can't be blank" }
end
