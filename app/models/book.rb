class Book < ApplicationRecord
  belongs_to :material
  delegate :tsundoc, to: :material

  # ↓これをmaterialクラスに移管する
  # def self.create(book_params)
  #   material = Material.create
  #   super(book_params.merge(material_id: material.id))
  # end
end
