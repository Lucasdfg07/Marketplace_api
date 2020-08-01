class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.belongs_to :product
      t.float :price
      t.timestamps
    end
  end
end
