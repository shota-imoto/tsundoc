class Movie < ApplicationRecord
  belongs_to :material
  delegate :tsundoc, to: :material
end
