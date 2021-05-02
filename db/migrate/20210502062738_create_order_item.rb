class CreateOrderItem < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :product
      t.decimal :amount
      t.decimal :grand_total
      t.timestamps
    end
  end
end
