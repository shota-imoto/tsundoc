class Tagging < ApplicationRecord
  belongs_to :tsundoc
  belongs_to :tag

  def self.factory(tag_ids = [], tsundoc_id = nil)
    tag_ids.each{ |id| Tagging.create(tag_id: id, tsundoc_id: tsundoc_id) }
  end
end
