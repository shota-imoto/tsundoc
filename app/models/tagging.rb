class Tagging < ActiveRecord
  belongs_to :tsundoc
  belongs_to :tag
end
