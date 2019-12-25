class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :images, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :menus, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :menus, allow_destroy: true
  has_many :recipes, inverse_of: :post, dependent: :destroy
  accepts_nested_attributes_for :recipes, allow_destroy: true

  # belongs_to :recipe
  # belongs_to :menue

  def self.search(search)
    return Post.all unless search
    Post.where('name LIKE(?)', "%#{search}%")
    Post.where('text LIKE(?)', "%#{search}%")
  end
  mount_uploader :image, ImageUploader
end
