class CreateProductMediaFiles < ActiveRecord::Migration[6.1]
  def change
    create_table :product_media_files do |t|

      t.timestamps
    end
  end
end
