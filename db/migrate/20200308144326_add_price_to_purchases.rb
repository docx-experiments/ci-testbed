class AddPriceToPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :price, :decimal, precision: 10, scale: 2
  end
end
