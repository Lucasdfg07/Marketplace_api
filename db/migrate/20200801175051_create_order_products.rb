class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.belongs_to :order
      t.belongs_to :product
      t.integer :quantity
      t.timestamps
    end
  end
end
