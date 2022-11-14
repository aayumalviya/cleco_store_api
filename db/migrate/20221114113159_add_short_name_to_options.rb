class AddShortNameToOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :options, :short_name, :string
  end
end
