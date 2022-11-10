class AddProductIdToProductMediaFile < ActiveRecord::Migration[6.1]
  def change
    add_column :product_media_files, :product_id, :integer
  end
end
