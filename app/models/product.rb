class Product < ApplicationRecord
    belongs_to :category
    
    validates_presence_of :name, :description, :price, :size
end
