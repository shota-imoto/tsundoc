class TsundocList < ApplicationRecord
  belongs_to :user
  has_many :tsundocs

  def self.owned_by(user)
    user.tsundoc_list
  end

  def gets_tsundocs_of(tsundocable_type)
    tsundocs.find_all{|t| t.is?(tsundocable_type)}
  end
end
