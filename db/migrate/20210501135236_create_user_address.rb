class CreateUserAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
      t.references :user
      t.string :telephone
      t.string :address_1
      t.string :address_2
      t.string :zip_code
      t.string :province
      t.string :country
      t.boolean :main_address
      t.timestamps
    end
  end
end
