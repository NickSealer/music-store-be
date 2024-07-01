class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :category, default: 0
      t.string :color
      t.integer :status, default: 1
      t.boolean :listing, default: true
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
