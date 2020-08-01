class Sale < ApplicationRecord
    belongs_to :product

    validates_presence_of :price
end
