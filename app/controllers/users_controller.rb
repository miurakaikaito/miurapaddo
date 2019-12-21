class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @nickname = current_user.nickname
    @post = current_user.posts
    @image = current_user.image
  end

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @post = current_user.post
  end

end
