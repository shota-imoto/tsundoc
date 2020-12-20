class Tsundoc < ApplicationRecord
  include TsundocHelper
  belongs_to :user
  belongs_to :tsundocable, polymorphic: true
  has_many :taggings
  has_many :tags, through: :taggings

  def self.tags_sort
    each{|t| t.tagging}
  end

  def is?(checked_type)
    tsundocable_type == checked_type
  end
end
