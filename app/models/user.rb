class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  validates :nickname,              presence: true
  validates :email,                 presence: true
  validates :password,              presence: true
  validates :password_confirmation, presence: true
  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  mount_uploader :image, ImageUploader

  # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)
  
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
  
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
