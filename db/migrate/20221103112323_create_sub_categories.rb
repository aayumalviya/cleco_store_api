class CreateSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :sub_categories do |t|
      t.string :name
      t.string :logo
      t.integer :category_id

      t.timestamps
    end
  end
end
