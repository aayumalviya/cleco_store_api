class AddCategoryIdAndIsPublishedToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :category_id, :integer
    add_column :products, :is_published, :boolean, default: false
  end
end
