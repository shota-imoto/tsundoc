class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :yondocos
  has_many :tsundocs
  has_many :book_tags
  has_many :movie_tags

  def get_associated_objects(class_name)
    send(class_name.underscore.pluralize)
  end

  def gets_tsundocs_of(tsundocable_type)
    tsundocs.find_all{|t| t.is?(tsundocable_type)}
  end
end
