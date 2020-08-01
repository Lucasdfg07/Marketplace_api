class Address < ApplicationRecord
    validates_presence_of :street, :number, :cep, :neighborhood, :city, :state
end
