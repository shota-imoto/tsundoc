class Book < ApplicationRecord
  include BookHelper
  belongs_to :material
  delegate :tsundoc, to: :material

end
