class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :menus, inverse_of: :post, dependent: :destroy
  has_many :recipes, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true
  accepts_nested_attributes_for :recipes, allow_destroy: true

  validates :name,              presence: true
  validates :image,                 presence: true

  def self.search(search)
    return Post.all unless search
    Post.where('name LIKE(?)', "%#{search}%")
    # Menu.where('menu LIKE(?)', "%#{search}%")
    
  end
  mount_uploader :image, ImageUploader
end
