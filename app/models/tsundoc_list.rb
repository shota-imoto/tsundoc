class TsundocList < ApplicationRecord
  belongs_to :user
  has_many :tsundocs

  def self.owned_by(user)
    user.tsundoc_list
  end
end
