class Tag < ApplicationRecord
  has_many :tagging
  validates :name, presence: true

  def self.factory(params)
    # レコード作成の成否をbooleanで返すため、createではなくnew+saveを用いる
    const_get(params[:type]).new(params).save
  end
end
