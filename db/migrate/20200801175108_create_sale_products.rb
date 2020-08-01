class CreateSaleProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_products do |t|
      t.belongs_to :sale
      t.belongs_to :product
      t.timestamps
    end
  end
end
