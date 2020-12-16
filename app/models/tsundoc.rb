class Tsundoc < ApplicationRecord
  include TsundocHelper
  belongs_to :tsundoc_list
  belongs_to :tsundocable, polymorphic: true
  has_many :taggings
  has_many :tags, through: :taggings


  def self.list_owned_by(user)
    TsundocList.owned_by(user).tsundocs
  end

  def self.tags_sort
    each{|t| t.tagging}
  end


  def is?(checked_type)
    tsundocable_type == checked_type
  end

end
