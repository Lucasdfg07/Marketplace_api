class User < ApplicationRecord
  belongs_to :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :email, :telephone, :document

  role: [:admin, :client]
end
