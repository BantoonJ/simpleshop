class CreateRegions < ActiveRecord::Migration[6.0]
  def up
    create_table :regions do |t|
      t.string :title
      # can be normalize to country table and use country_id later
      t.string :country
      # can be normalize to currency table and use currency_id later
      t.string :currency
      t.decimal :tax
      t.timestamps null: false
    end
  end

  def down
    drop_table :regions
  end
end
