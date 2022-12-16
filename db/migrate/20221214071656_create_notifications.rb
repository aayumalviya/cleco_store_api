class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.boolean :user_checked, default: false
      t.integer :user_id
      t.references :notifiable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
