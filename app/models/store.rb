class Store < ApplicationRecord
  validates_presence_of :name, :description, :email, :identification
  validates :email, uniqueness: true
  validates :identification, numericality: { only_integer: true }
  validates :identification, length: { minimum: 8, maximum: 12 }
end
