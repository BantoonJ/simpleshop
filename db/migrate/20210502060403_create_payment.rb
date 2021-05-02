class CreatePayment < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :order
      t.string :status
      t.timestamps
    end
  end
end
