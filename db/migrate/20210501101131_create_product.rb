class CreateProduct < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :region
      t.string :title
      t.string :description
      t.string :image
      t.decimal :price
      t.string :sku
      t.integer :stock_number
      t.timestamps
    end
  end
end
