class Tag < ApplicationRecord
  has_many :taggings
  has_many :tsundocs, through: :taggings
  belongs_to :user
  validates :name, presence: true

  def self.create_by_type(params)
    return raise "Forget send tag type ??" if params[:type].nil?
    # レコード作成の成否をbooleanで返すため、createではなくnew+saveを用いる
    const_get(params[:type]).new(params).save
  end

end
