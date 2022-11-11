class AddIsRecommondedToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :is_recommended, :boolean, default: false
  end
end
