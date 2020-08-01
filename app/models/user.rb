class User < ApplicationRecord
  belongs_to :address

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_token_authenticatable

  validates_presence_of :name, :telephone, :document

  validates_uniqueness_of :email

  enum role: [:admin, :client]
end
