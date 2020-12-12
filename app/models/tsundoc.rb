class Tsundoc < ApplicationRecord
  include TsundocHelper
  belongs_to :tsundoc_list
  belongs_to :tsundocable, polymorphic: true

  def self.list_owned_by(user)
    TsundocList.owned_by(user).tsundocs
  end

  def is?(checked_type)
    tsundocable_type == checked_type
  end
end
