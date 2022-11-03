class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :product_description
      t.integer :price
      t.integer :old_price
      t.integer :exclusive_price
      t.string :image
      t.string :product_details

      t.timestamps
    end
  end
end
