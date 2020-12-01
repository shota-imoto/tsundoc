class Tsundoc < ApplicationRecord
  include TsundocHelper
  belongs_to :material
  belongs_to :tsundoc_list

  def self.list_owned_by(user)
    TsundocList.owned_by(user).tsundocs
  end

  def get_tsundoc_product(kind = "book")
    material.get_tsundoc_product(kind)
  end


end
