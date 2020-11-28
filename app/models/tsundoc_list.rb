class TsundocList < ApplicationRecord
  belongs_to :user
  has_many :tsundocs
end
