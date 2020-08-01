class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.integer :quantity_of_parcels
      t.string :status
      t.timestamps
    end
  end
end
