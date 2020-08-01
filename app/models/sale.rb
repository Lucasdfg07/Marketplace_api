class Sale < ApplicationRecord
    has_many :products

    validates_presence_of :price
end
