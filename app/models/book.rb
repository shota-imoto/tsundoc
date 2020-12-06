class Book < ApplicationRecord
  include BookHelper
  has_many :tsundocs, as: :tsundocable
end
