class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  # belongs_to :recipe
  # belongs_to :menue

  def self.search(search)
    return Post.all unless search
    Post.where('name LIKE(?)', "%#{search}%")
    Post.where('text LIKE(?)', "%#{search}%")
  end
  mount_uploader :image, ImageUploader
end
