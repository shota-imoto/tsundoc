class Book < ApplicationRecord
  belongs_to :material
  delegate :tsundoc, to: :material

  # def create(tsundoc_params)
  #   material = Material.create
  #   create(tsundoc_params)
  # end

end
