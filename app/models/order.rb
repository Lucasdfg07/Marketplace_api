class Order < ApplicationRecord
    has_many :order_products
    has_many :products, through: :order_products
    
    belongs_to :user

    validates_presence_of :status
end
