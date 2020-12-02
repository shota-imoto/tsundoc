class Material < ApplicationRecord
  has_many :tsundocs
  has_one :book
  has_one :movie

  def self.factory(kind, params)
    material = create
    const_get(kind.classify).create(params.merge(material_id: material.id))
  end

  def get_tsundoc_product(kind = "book")
    send(kind.downcase)
  end
end
