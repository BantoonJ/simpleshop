class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.references :user_address
      t.string :receiver_name
      t.string :receiver_lastname
      t.decimal :shipping_cost
      t.decimal :grand_total
      t.timestamps
    end
  end
end
