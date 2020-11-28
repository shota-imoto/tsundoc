class Book < ApplicationRecord
  belongs_to :material
  deligate :tsundoc, to: :material
end
