class Material < ApplicationRecord
  has_many :tsundocs
  has_one :book
  has_one :movie
end
