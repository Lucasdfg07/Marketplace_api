class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :category
      t.string :name
      t.string :description
      t.float :price
      t.string :size
      t.timestamps
    end
  end
end
