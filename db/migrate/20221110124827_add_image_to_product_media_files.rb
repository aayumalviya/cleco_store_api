class AddImageToProductMediaFiles < ActiveRecord::Migration[6.1]
  def change
    add_column :product_media_files, :image, :string
  end
end
