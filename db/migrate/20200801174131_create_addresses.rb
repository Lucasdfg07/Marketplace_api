class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :cep
      t.string :neighborhood
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
