class Sale < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :purchaser_name
      t.string :item_description
      t.float :item_price
      t.integer :purchase_count
      t.string :merchant_address
      t.string :merchant_name

      t.timestamps
    end

    [:purchaser_name, :item_description, :merchant_name].each do |col|
      add_index :sales, col
    end
  end
end
