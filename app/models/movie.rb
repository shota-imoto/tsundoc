class Movie < ApplicationRecord
  include MovieHelper
  has_many :tsundocs, as: :tsundocable
end
