class CreateProductMedia < ActiveRecord::Migration[6.1]
  def change
    create_table :product_media do |t|

      t.timestamps
    end
  end
end
