class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :title
      t.datetime :valid_from
      t.datetime :valid_to
      t.boolean :is_active, default: false

      t.timestamps
    end
  end
end
