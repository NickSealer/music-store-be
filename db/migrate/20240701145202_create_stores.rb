class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :description
      t.string :email
      t.integer :identification

      t.timestamps
    end

    add_index :stores, :identification
  end
end
