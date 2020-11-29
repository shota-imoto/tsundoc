class Movie < ApplicationRecord
  belongs_to :material
  delegate :tsundoc, to: :material

  def common_id
    material.id
  end
end
